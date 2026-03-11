from django.shortcuts import render, get_object_or_404,redirect
from django.db.models import Q
from django.db import transaction
import qrcode
from io import BytesIO
import base64
import json
import re
import urllib.parse
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from django.conf import settings
from django.utils import timezone
from .forms import RegisterForm, LoginForm
from django.http import JsonResponse
from .models import (
    Product, Category, ProductVariant,
    Cart, CartItem,
    Order, OrderItem, Payment,
    ViewHistory, Wishlist
)
from django.db.models import Sum, Count, Q, Value
from django.db.models.functions import Coalesce


def home(request):
    """Trang chủ - Hiển thị sản phẩm mới nhất và bán chạy"""
    latest_products = Product.objects.filter(is_active=True).order_by('-created_at')[:8]
    
    # Sản phẩm bán chạy: tính tổng số lượng đã bán từ OrderItem
    # Chỉ tính đơn hàng đã thanh toán (paid) hoặc hoàn thành (completed)
    trending_products = (
        Product.objects.filter(is_active=True)
        .annotate(
            total_sold=Coalesce(
                Sum(
                    'orderitem__quantity',
                    filter=Q(orderitem__order__status__in=['paid', 'completed'])
                ),
                Value(0)
            )
        )
        .order_by('-total_sold', '-created_at')[:8]
    )
    
    # Lấy danh mục cha (Đồ nam, Đồ nữ)
    parent_categories = Category.objects.filter(parent__isnull=True)
    
    context = {
        'latest_products': latest_products,
        'trending_products': trending_products,
        'parent_categories': parent_categories,
    }
    return render(request, 'shop/home.html', context)


def product_list(request):
    """Danh sách sản phẩm - Có lọc và tìm kiếm"""
    products = Product.objects.filter(is_active=True)
    
    # Lấy tất cả danh mục
    parent_categories = Category.objects.filter(parent__isnull=True)
    all_categories = Category.objects.all()
    
    # Lọc theo danh mục
    category_id = request.GET.get('category')
    selected_category = None
    
    if category_id:
        selected_category = Category.objects.get(id=category_id)
        
        # Nếu là danh mục cha (Đồ nam/nữ) → lấy tất cả sản phẩm của danh mục con
        if selected_category.subcategories.exists():
            products = products.filter(category__parent=selected_category)
        else:
            # Nếu là danh mục con → lấy sản phẩm của danh mục đó
            products = products.filter(category=selected_category)
    
    # Tìm kiếm theo tên
    search_query = request.GET.get('search')
    if search_query:
        products = products.filter(
            Q(name__icontains=search_query) | 
            Q(description__icontains=search_query)
        )
    
    # Sắp xếp
    sort_by = request.GET.get('sort', '-created_at')
    if sort_by in ['price', '-price', 'name', '-created_at']:
        products = products.order_by(sort_by)
    
    context = {
        'products': products,
        'parent_categories': parent_categories,
        'all_categories': all_categories,
        'selected_category': selected_category,
        'search_query': search_query,
        'sort_by': sort_by,
    }
    return render(request, 'shop/product_list.html', context)

def product_detail(request, pk):
    """Chi tiết sản phẩm"""
    product = get_object_or_404(Product, pk=pk, is_active=True)
    variants = product.variants.filter(is_available=True)
    
    # ===== LƯỚI LỊCH SỬ XEM =====
    # Lưu lịch sử xem (nếu user đã đăng nhập)
    if request.user.is_authenticated:
        ViewHistory.objects.create(
            user=request.user,
            product=product
        )
    
    # Gợi ý sản phẩm liên quan (cùng danh mục, trừ sản phẩm hiện tại)
    related_products = Product.objects.filter(
        category=product.category,
        is_active=True
    ).exclude(id=product.id).order_by('?')[:4]  # Lấy 4 sản phẩm ngẫu nhiên
    # ===== HẾT PHẦN THÊM =====
    
    # Lấy các size và màu có sẵn
    SIZE_ORDER = ['s', 'm', 'l', 'xl', 'xxl', 'freesize']

    sizes_raw = list(variants.values_list('size', flat=True))

    available_sizes = sorted(
        [s for s in set(sizes_raw) if s],  # Loại bỏ None và chuỗi rỗng
        key=lambda x: SIZE_ORDER.index(x.lower())
        if x and x.lower() in SIZE_ORDER
        else len(SIZE_ORDER)
    )
    available_colors = [c for c in variants.values_list('color', flat=True).distinct() if c]

    # ===== UNIQUE COLORS (deduplicated, with display name & image) =====
    color_display_map = dict(ProductVariant.COLOR_CHOICES)
    unique_colors_dict = {}
    for v in variants:
        if v.color:
            if v.color not in unique_colors_dict:
                unique_colors_dict[v.color] = {
                    'code': v.color,
                    'display': color_display_map.get(v.color, v.color),
                    'image_url': v.image.url if v.image else '',
                }
            # Nếu chưa có ảnh nhưng variant hiện tại có ảnh -> cập nhật ảnh
            elif not unique_colors_dict[v.color]['image_url'] and v.image:
                unique_colors_dict[v.color]['image_url'] = v.image.url

    unique_colors = []
    for color_data in unique_colors_dict.values():
        if not color_data['image_url'] and product.image:
            color_data['image_url'] = product.image.url
        unique_colors.append(color_data)

    # ===== VARIANTS JSON for frontend dynamic filtering =====
    variants_data = []
    for v in variants:
        variants_data.append({
            'id': v.id,
            'color': v.color or '',
            'size': v.size or '',
            'stock': v.stock,
            'image_url': v.image.url if v.image else '',
        })
    variants_json = json.dumps(variants_data)

    context = {
        'product': product,
        'variants': variants,
        'available_sizes': available_sizes,
        'available_colors': available_colors,
        'unique_colors': unique_colors,
        'variants_json': variants_json,
        'related_products': related_products,
    }
    return render(request, 'shop/product_detail.html', context)
def register_view(request):
    """Đăng ký tài khoản"""
    if request.user.is_authenticated:
        return redirect('shop:home')
    
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, f'Chào mừng {user.username}! Đăng ký thành công.')
            return redirect('shop:home')
    else:
        form = RegisterForm()
    
    return render(request, 'shop/register.html', {'form': form})


def login_view(request):
    """Đăng nhập"""
    if request.user.is_authenticated:
        return redirect('shop:home')
    
    if request.method == 'POST':
        form = LoginForm(data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                messages.success(request, f'Chào mừng trở lại, {user.username}!')
                
                # Redirect về trang admin nếu là admin, ngược lại về trang trước đó hoặc trang chủ
                if user.is_staff or user.is_superuser:
                    return redirect('/admin')
                next_url = request.GET.get('next', 'shop:home')
                return redirect(next_url)
    else:
        form = LoginForm()
    
    return render(request, 'shop/login.html', {'form': form})


@login_required
def logout_view(request):
    """Đăng xuất"""
    logout(request)
    messages.success(request, 'Đã đăng xuất thành công.')
    return redirect('shop:home')


@login_required
def profile_view(request):
    """Trang thông tin cá nhân"""
    return render(request, 'shop/profile.html')

@login_required
def cart_view(request):
    """Xem giỏ hàng"""
    cart, created = Cart.objects.get_or_create(user=request.user)
    cart_items = cart.items.all() 

    context = {
        'cart': cart,
        'cart_items': cart_items,
    }
    return render(request, 'shop/cart.html', context)



@login_required
def add_to_cart(request, product_id):
    """Thêm sản phẩm vào giỏ hàng"""
    if request.method == 'POST':
        product = get_object_or_404(Product, pk=product_id, is_active=True)
        
        # Lấy variant (size + màu) từ form
        size = request.POST.get('size', '').strip() or None
        color = request.POST.get('color', '').strip() or None
        quantity = int(request.POST.get('quantity', 1))
        
        # Tìm variant phù hợp
        variant = None
        if size or color:
            try:
                variant = ProductVariant.objects.get(
                    product=product,
                    size=size if size else None,
                    color=color if color else None,
                    is_available=True
                )
                
                # Kiểm tra tồn kho
                if variant.stock < quantity:
                    messages.error(request, f'Sản phẩm chỉ còn {variant.stock} trong kho!')
                    return redirect('shop:product_detail', pk=product_id)
                    
            except ProductVariant.DoesNotExist:
                messages.error(request, 'Vui lòng chọn size và màu!')
                return redirect('shop:product_detail', pk=product_id)
        
        # Lấy hoặc tạo giỏ hàng
        cart, created = Cart.objects.get_or_create(user=request.user)
        
        # Kiểm tra sản phẩm đã có trong giỏ chưa
        cart_item, created = CartItem.objects.get_or_create(
            cart=cart,
            product=product,
            variant=variant,
            defaults={'quantity': quantity}
        )
        
        if not created:
            # Nếu đã có thì tăng số lượng
            new_quantity = cart_item.quantity + quantity
            
            # Kiểm tra tồn kho
            if variant and variant.stock < new_quantity:
                messages.error(request, f'Sản phẩm chỉ còn {variant.stock} trong kho!')
                return redirect('shop:product_detail', pk=product_id)
            
            cart_item.quantity = new_quantity
            cart_item.save()
            messages.success(request, f'Đã cập nhật số lượng sản phẩm!')
        else:
            messages.success(request, f'Đã thêm "{product.name}" vào giỏ hàng!')
        
        return redirect('shop:cart')
    
    return redirect('shop:product_detail', pk=product_id)


@login_required
def update_cart(request, item_id):
    """Cập nhật số lượng sản phẩm trong giỏ - AJAX"""
    if request.method == 'POST':
        cart_item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
        quantity = int(request.POST.get('quantity', 1))
        
        if quantity <= 0:
            cart_item.delete()
            return JsonResponse({'status': 'success', 'message': 'Đã xóa sản phẩm'})
        else:
            # Kiểm tra tồn kho
            if cart_item.variant and cart_item.variant.stock < quantity:
                return JsonResponse({
                    'status': 'error',
                    'message': f'Sản phẩm chỉ còn {cart_item.variant.stock} trong kho!'
                }, status=400)
            
            cart_item.quantity = quantity
            cart_item.save()
            return JsonResponse({
                'status': 'success',
                'message': 'Đã cập nhật số lượng',
                'item_total': float(cart_item.get_subtotal()),
                'cart_total': float(cart_item.cart.get_total()),
                'quantity': quantity,
            })
    
    return JsonResponse({'status': 'error'}, status=400)


@login_required
def remove_from_cart(request, item_id):
    """Xóa sản phẩm khỏi giỏ hàng"""
    cart_item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
    product_name = cart_item.product.name
    cart_item.delete()
    messages.success(request, f'Đã xóa "{product_name}" khỏi giỏ hàng!')
    return redirect('shop:cart')


@login_required
def clear_cart(request):
    """Xóa toàn bộ giỏ hàng"""
    if request.method == 'POST':
        cart = get_object_or_404(Cart, user=request.user)
        cart.items.all().delete()
        messages.success(request, 'Đã xóa toàn bộ giỏ hàng!')
    return redirect('shop:cart')


@login_required
def checkout(request):
    cart = get_object_or_404(Cart, user=request.user)

    if request.method == 'POST':
        selected_ids = request.POST.getlist('selected_items')

        if not selected_ids:
            messages.warning(request, 'Vui lòng chọn ít nhất 1 sản phẩm để thanh toán.')
            return redirect('shop:cart')

        request.session['selected_cart_items'] = selected_ids
        cart_items = cart.items.filter(id__in=selected_ids)

    else:
        selected_ids = request.session.get('selected_cart_items', [])
        cart_items = cart.items.filter(id__in=selected_ids)

    if not cart_items.exists():
        messages.warning(request, 'Không có sản phẩm nào để thanh toán.')
        return redirect('shop:cart')

    # Tính subtotal trong Python (không tính trong template)
    subtotal = sum(item.get_subtotal() for item in cart_items)

    return render(request, 'shop/checkout.html', {
        'cart': cart,
        'cart_items': cart_items,
        'subtotal': subtotal,
    })



@login_required
@transaction.atomic
def create_order(request):
    if request.method == 'POST':
        cart = get_object_or_404(Cart, user=request.user)
        selected_ids = request.session.get('selected_cart_items', [])
        cart_items = cart.items.filter(id__in=selected_ids)

        if not cart_items.exists():
            messages.warning(request, 'Không có sản phẩm nào để tạo đơn.')
            return redirect('shop:cart')

        # ✅ Kiểm tra tồn kho
        for item in cart_items:
            if item.variant and item.variant.stock < item.quantity:
                messages.error(
                    request,
                    f'{item.product.name} không đủ hàng trong kho!'
                )
                return redirect('shop:checkout')

        # ✅ TÍNH ĐÚNG TỔNG TIỀN (CHỈ ITEM ĐÃ CHỌN)
        total_price = sum(item.get_subtotal() for item in cart_items)

        # ✅ TẠO ĐƠN
        order = Order.objects.create(
            user=request.user,
            total_price=total_price,
            status='pending'
        )

        # ✅ TẠO ORDER ITEM + TRỪ KHO
        for item in cart_items:
            OrderItem.objects.create(
                order=order,
                product=item.product,
                variant=item.variant,
                quantity=item.quantity,
                price=item.product.price
            )

            if item.variant:
                item.variant.stock -= item.quantity
                if item.variant.stock <= 0:
                    item.variant.is_available = False
                item.variant.save()

        # ✅ LẤY PHƯƠNG THỨC THANH TOÁN TỪ FORM
        payment_method = request.POST.get('payment_method', 'qr_code')
        
        # ✅ TẠO PAYMENT
        Payment.objects.create(
            order=order,
            method=payment_method,
            status='pending'
        )

        # ✅ XÓA CHỈ CÁC ITEM ĐÃ THANH TOÁN (KHÔNG XÓA TOÀN BỘ CART)
        cart_items.delete()
        
        # ✅ XÓA SESSION SELECTED ITEMS
        request.session.pop('selected_cart_items', None)

        messages.success(request, f'Đơn hàng #{order.id} đã được tạo thành công!')
        return redirect('shop:payment', order_id=order.id)

    return redirect('shop:checkout')


@login_required
def payment_view(request, order_id):
    """Trang thanh toán QR Code VietQR"""
    order = get_object_or_404(Order, id=order_id, user=request.user)
    payment = get_object_or_404(Payment, order=order)
    
    # Tạo mã tham chiếu nếu chưa có
    if not payment.reference_code:
        payment.reference_code = f"DH{order.id}"
        payment.save()
    
    # Tạo URL VietQR
    bank_id = getattr(settings, 'VIETQR_BANK_ID', 'ICB')
    account_no = getattr(settings, 'VIETQR_ACCOUNT_NO', '')
    account_name = getattr(settings, 'VIETQR_ACCOUNT_NAME', '')
    amount = int(order.total_price)
    description = urllib.parse.quote(payment.reference_code)
    
    # URL VietQR API (miễn phí)
    qr_url = f"https://img.vietqr.io/image/{bank_id}-{account_no}-compact2.png?amount={amount}&addInfo={description}&accountName={urllib.parse.quote(account_name)}"
    
    # Mapping mã ngân hàng sang tên
    bank_names = {
        'ICB': 'Vietinbank',
        'VCB': 'Vietcombank',
        'BIDV': 'BIDV',
        'MB': 'MB Bank',
        'TCB': 'Techcombank',
        'ACB': 'ACB',
        'TPB': 'TPBank',
        'VPB': 'VPBank',
    }
    
    context = {
        'order': order,
        'payment': payment,
        'qr_url': qr_url,
        'bank_name': bank_names.get(bank_id, bank_id),
        'account_no': account_no,
        'account_name': account_name,
    }
    return render(request, 'shop/payment.html', context)


@login_required
def confirm_payment(request, order_id):
    """Xác nhận đã thanh toán (thủ công)"""
    if request.method == 'POST':
        order = get_object_or_404(Order, id=order_id, user=request.user)
        payment = get_object_or_404(Payment, order=order)
        
        # Cập nhật trạng thái
        payment.status = 'completed'
        payment.paid_at = timezone.now()
        payment.save()
        
        order.status = 'paid'
        order.save()
        
        messages.success(request, 'Cảm ơn bạn đã thanh toán! Đơn hàng của bạn đang được xử lý.')
        return redirect('shop:order_detail', order_id=order.id)
    
    return redirect('shop:payment', order_id=order_id)


@csrf_exempt
@require_POST
def sepay_webhook(request):
    """
    Webhook nhận thông báo thanh toán từ SePay
    SePay sẽ gọi endpoint này khi có giao dịch mới
    """
    # Xác thực API Key từ header
    auth_header = request.headers.get('Authorization', '')
    expected_key = f"Apikey {getattr(settings, 'SEPAY_API_KEY', '')}"
    
    if auth_header != expected_key:
        return JsonResponse({'success': False, 'error': 'Unauthorized'}, status=401)
    
    try:
        data = json.loads(request.body)
        
        # Lấy thông tin giao dịch từ SePay
        content = data.get('content', '')  # Nội dung chuyển khoản
        amount = data.get('transferAmount', 0)
        transaction_id = data.get('id')
        
        # Tìm mã đơn hàng trong nội dung chuyển khoản
        # VD: content = "DH123 chuyen khoan" hoặc "thanh toan DH123"
        match = re.search(r'DH(\d+)', content.upper())
        
        if not match:
            return JsonResponse({
                'success': False, 
                'error': 'No order reference found in content'
            })
        
        order_id = int(match.group(1))
        
        try:
            payment = Payment.objects.get(
                order_id=order_id,
                status='pending'
            )
            
            # Kiểm tra số tiền khớp (cho phép chênh lệch 1000đ do làm tròn)
            expected_amount = int(payment.order.total_price)
            received_amount = int(amount)
            
            if abs(expected_amount - received_amount) > 1000:
                return JsonResponse({
                    'success': False, 
                    'error': f'Amount mismatch: expected {expected_amount}, received {received_amount}'
                })
            
            # Cập nhật thanh toán thành công
            payment.status = 'completed'
            payment.transaction_id = str(transaction_id)
            payment.paid_at = timezone.now()
            payment.save()
            
            # Cập nhật trạng thái đơn hàng
            payment.order.status = 'paid'
            payment.order.save()
            
            return JsonResponse({
                'success': True,
                'message': f'Payment confirmed for order #{order_id}'
            })
            
        except Payment.DoesNotExist:
            return JsonResponse({
                'success': False, 
                'error': f'Payment for order #{order_id} not found or already completed'
            })
            
    except json.JSONDecodeError:
        return JsonResponse({'success': False, 'error': 'Invalid JSON'}, status=400)
    except Exception as e:
        return JsonResponse({'success': False, 'error': str(e)}, status=500)


@login_required
def check_payment_status(request, order_id):
    """
    API kiểm tra trạng thái thanh toán (cho frontend polling)
    Frontend gọi API này mỗi vài giây để check xem đã thanh toán chưa
    """
    order = get_object_or_404(Order, id=order_id, user=request.user)
    payment = get_object_or_404(Payment, order=order)
    
    return JsonResponse({
        'status': payment.status,
        'paid': payment.status == 'completed',
        'order_id': order.id
    })


@login_required
def order_list(request):
    """Danh sách đơn hàng của user"""
    orders = Order.objects.filter(user=request.user).order_by('-created_at')
    
    context = {
        'orders': orders,
    }
    return render(request, 'shop/order_list.html', context)


@login_required
def order_detail(request, order_id):
    """Chi tiết đơn hàng"""
    order = get_object_or_404(Order, id=order_id, user=request.user)
    
    context = {
        'order': order,
    }
    return render(request, 'shop/order_detail.html', context)


@login_required
def admin_statistics(request):
    """Thống kê cho admin với biểu đồ - Dashboard hoàn chỉnh"""
    if not (request.user.is_staff or request.user.is_superuser):
        messages.error(request, 'Bạn không có quyền truy cập trang này.')
        return redirect('shop:home')
    
    import json
    from decimal import Decimal
    from datetime import datetime, timedelta
    from django.db.models.functions import ExtractYear, ExtractMonth, ExtractDay, ExtractWeek
    
    today = timezone.now()
    
    # ===== Helper: chuyển Decimal -> float an toàn =====
    def decimal_to_float(val):
        if val is None:
            return 0.0
        if isinstance(val, Decimal):
            return float(val)
        return float(val)
    
    # ===== THỐNG KÊ TỔNG QUAN =====
    paid_statuses = ['paid', 'completed']
    total_orders = Order.objects.count()
    total_revenue = decimal_to_float(
        Order.objects.filter(status__in=paid_statuses)
        .aggregate(s=Sum('total_price'))['s']
    )
    total_products = Product.objects.filter(is_active=True).count()
    total_users = User.objects.filter(is_active=True, is_staff=False).count()
    total_paid_orders = Order.objects.filter(status__in=paid_statuses).count()
    pending_orders = Order.objects.filter(status='pending').count()
    
    # ===== 1) DOANH THU THEO NGÀY (30 ngày gần nhất) =====
    thirty_days_ago = today - timedelta(days=30)
    daily_qs = list(
        Order.objects.filter(created_at__gte=thirty_days_ago, status__in=paid_statuses)
        .exclude(created_at__isnull=True)
        .annotate(
            yr=ExtractYear('created_at'),
            mn=ExtractMonth('created_at'),
            dy=ExtractDay('created_at')
        )
        .values('yr', 'mn', 'dy')
        .annotate(revenue=Sum('total_price'))
        .order_by('yr', 'mn', 'dy')
    )
    daily_qs = [item for item in daily_qs if item['dy']]
    daily_labels = [f"{int(item['dy']):02d}/{int(item['mn']):02d}" for item in daily_qs]
    daily_revenue = [decimal_to_float(item['revenue']) for item in daily_qs]
    
    # ===== 2) DOANH THU THEO TUẦN (12 tuần gần nhất) =====
    twelve_weeks_ago = today - timedelta(weeks=12)
    weekly_qs = list(
        Order.objects.filter(created_at__gte=twelve_weeks_ago, status__in=paid_statuses)
        .exclude(created_at__isnull=True)
        .annotate(yr=ExtractYear('created_at'), wk=ExtractWeek('created_at'))
        .values('yr', 'wk')
        .annotate(revenue=Sum('total_price'))
        .order_by('yr', 'wk')
    )
    weekly_qs = [item for item in weekly_qs if item['yr'] and item['wk']]
    weekly_labels = [f"T{item['wk']}/{item['yr']}" for item in weekly_qs]
    weekly_revenue = [decimal_to_float(item['revenue']) for item in weekly_qs]
    
    # ===== 3) DOANH THU THEO THÁNG (12 tháng gần nhất) =====
    twelve_months_ago = today - timedelta(days=365)
    monthly_qs = list(
        Order.objects.filter(created_at__gte=twelve_months_ago, status__in=paid_statuses)
        .exclude(created_at__isnull=True)
        .annotate(yr=ExtractYear('created_at'), mn=ExtractMonth('created_at'))
        .values('yr', 'mn')
        .annotate(revenue=Sum('total_price'), count=Count('id'))
        .order_by('yr', 'mn')
    )
    monthly_qs = [item for item in monthly_qs if item['yr'] and item['mn']]
    monthly_labels = [f"{int(item['mn']):02d}/{item['yr']}" for item in monthly_qs]
    monthly_revenue = [decimal_to_float(item['revenue']) for item in monthly_qs]
    monthly_orders = [item['count'] for item in monthly_qs]
    
    # ===== 4) DOANH THU THEO QUÝ (8 quý gần nhất) =====
    two_years_ago = today - timedelta(days=730)
    quarterly_qs = (
        Order.objects.filter(created_at__gte=two_years_ago, status__in=paid_statuses)
        .exclude(created_at__isnull=True)
        .annotate(yr=ExtractYear('created_at'), mn=ExtractMonth('created_at'))
        .values('yr', 'mn')
        .annotate(revenue=Sum('total_price'))
        .order_by('yr', 'mn')
    )
    # Gom theo quý
    quarter_map = {}
    for item in quarterly_qs:
        if not item['yr'] or not item['mn']:
            continue
        q_num = (item['mn'] - 1) // 3 + 1
        key = f"Q{q_num}/{item['yr']}"
        quarter_map[key] = quarter_map.get(key, 0) + decimal_to_float(item['revenue'])
    quarterly_labels = list(quarter_map.keys())
    quarterly_revenue = list(quarter_map.values())
    
    # ===== 5) DOANH THU THEO NĂM =====
    yearly_qs = list(
        Order.objects.filter(status__in=paid_statuses)
        .exclude(created_at__isnull=True)
        .annotate(yr=ExtractYear('created_at'))
        .values('yr')
        .annotate(revenue=Sum('total_price'))
        .order_by('yr')
    )
    yearly_qs = [item for item in yearly_qs if item['yr']]
    yearly_labels = [str(item['yr']) for item in yearly_qs]
    yearly_revenue = [decimal_to_float(item['revenue']) for item in yearly_qs]
    
    # ===== 6) DOANH THU THEO KHOẢNG THỜI GIAN TÙY CHỌN =====
    from_date_str = request.GET.get('from_date', '')
    to_date_str = request.GET.get('to_date', '')
    custom_labels = []
    custom_revenue = []
    custom_total = 0.0
    custom_count = 0
    
    if from_date_str and to_date_str:
        try:
            from_date = datetime.strptime(from_date_str, '%Y-%m-%d')
            to_date = datetime.strptime(to_date_str, '%Y-%m-%d')
            to_date_end = to_date + timedelta(days=1)
            
            custom_qs = (
                Order.objects.filter(
                    created_at__gte=from_date,
                    created_at__lt=to_date_end,
                    status__in=paid_statuses
                )
                .exclude(created_at__isnull=True)
                .annotate(
                    yr=ExtractYear('created_at'),
                    mn=ExtractMonth('created_at'),
                    dy=ExtractDay('created_at')
                )
                .values('yr', 'mn', 'dy')
                .annotate(revenue=Sum('total_price'))
                .order_by('yr', 'mn', 'dy')
            )
            custom_qs = [item for item in custom_qs if item['dy']]
            custom_labels = [f"{int(item['dy']):02d}/{int(item['mn']):02d}/{item['yr']}" for item in custom_qs]
            custom_revenue = [decimal_to_float(item['revenue']) for item in custom_qs]
            custom_total = sum(custom_revenue)
            custom_count = Order.objects.filter(
                created_at__gte=from_date,
                created_at__lt=to_date_end,
                status__in=paid_statuses
            ).count()
        except (ValueError, TypeError):
            pass
    
    # ===== 7) THỐNG KÊ HÀNG TỒN KHO =====
    inventory_products = (
        Product.objects.filter(is_active=True)
        .annotate(total_stock=Sum('variants__stock'))
        .order_by('total_stock')[:15]
    )
    inventory_labels = [p.name[:20] for p in inventory_products]
    inventory_data = [p.total_stock or 0 for p in inventory_products]
    
    # Tổng tồn kho
    from django.db.models import F
    total_stock = ProductVariant.objects.aggregate(s=Sum('stock'))['s'] or 0
    low_stock_count = ProductVariant.objects.filter(stock__lt=10, stock__gt=0).count()
    out_of_stock_count = ProductVariant.objects.filter(stock=0).count()
    
    # ===== 8) SẢN PHẨM BÁN CHẠY (Top 10) =====
    top_products = (
        Product.objects.annotate(
            total_sold=Sum(
                'orderitem__quantity',
                filter=Q(orderitem__order__status__in=paid_statuses)
            )
        )
        .filter(total_sold__gt=0)
        .order_by('-total_sold')[:10]
    )
    top_product_labels = [p.name[:25] for p in top_products]
    top_product_data = [p.total_sold or 0 for p in top_products]
    
    # ===== 9) ĐƠN HÀNG THEO TRẠNG THÁI (Doughnut chart) =====
    order_status_qs = (
        Order.objects.values('status')
        .annotate(count=Count('id'))
        .order_by('-count')
    )
    status_display = {
        'pending': 'Chờ thanh toán',
        'paid': 'Đã thanh toán',
        'processing': 'Đang xử lý',
        'shipping': 'Đang giao',
        'completed': 'Hoàn thành',
        'cancelled': 'Đã hủy',
    }
    status_colors_map = {
        'pending': '#FFC107',
        'paid': '#28A745',
        'processing': '#17A2B8',
        'shipping': '#007BFF',
        'completed': '#20C997',
        'cancelled': '#DC3545',
    }
    status_labels = []
    status_counts = []
    status_colors = []
    for s in order_status_qs:
        status_labels.append(status_display.get(s['status'], s['status']))
        status_counts.append(s['count'])
        status_colors.append(status_colors_map.get(s['status'], '#6C757D'))
    
    # ===== CONTEXT =====
    context = {
        # Tổng quan
        'total_orders': total_orders,
        'total_revenue': total_revenue,
        'total_products': total_products,
        'total_users': total_users,
        'total_paid_orders': total_paid_orders,
        'pending_orders': pending_orders,
        
        # 1) Doanh thu theo ngày
        'daily_labels': json.dumps(daily_labels),
        'daily_revenue': json.dumps(daily_revenue),
        
        # 2) Doanh thu theo tuần
        'weekly_labels': json.dumps(weekly_labels),
        'weekly_revenue': json.dumps(weekly_revenue),
        
        # 3) Doanh thu theo tháng
        'monthly_labels': json.dumps(monthly_labels),
        'monthly_revenue': json.dumps(monthly_revenue),
        'monthly_orders': json.dumps(monthly_orders),
        
        # 4) Doanh thu theo quý
        'quarterly_labels': json.dumps(quarterly_labels),
        'quarterly_revenue': json.dumps(quarterly_revenue),
        
        # 5) Doanh thu theo năm
        'yearly_labels': json.dumps(yearly_labels),
        'yearly_revenue': json.dumps(yearly_revenue),
        
        # 6) Tùy chọn khoảng thời gian
        'from_date': from_date_str,
        'to_date': to_date_str,
        'custom_labels': json.dumps(custom_labels),
        'custom_revenue': json.dumps(custom_revenue),
        'custom_total': custom_total,
        'custom_count': custom_count,
        
        # 7) Hàng tồn kho
        'inventory_labels': json.dumps(inventory_labels),
        'inventory_data': json.dumps(inventory_data),
        'total_stock': total_stock,
        'low_stock_count': low_stock_count,
        'out_of_stock_count': out_of_stock_count,
        
        # 8) Sản phẩm bán chạy
        'top_products': top_products,
        'top_product_labels': json.dumps(top_product_labels),
        'top_product_data': json.dumps(top_product_data),
        
        # 9) Trạng thái đơn hàng
        'status_labels': json.dumps(status_labels),
        'status_counts': json.dumps(status_counts),
        'status_colors': json.dumps(status_colors),
    }
    return render(request, 'shop/admin_statistics.html', context)


@login_required
def ai_recommendations(request):
    """
    Gợi ý sản phẩm dựa trên lịch sử xem - PHIÊN BẢN ĐƠN GIẢN
    Không cần pandas/sklearn
    """
    from django.db.models import Count
    
    # Lấy lịch sử xem của user (loại bỏ sản phẩm trùng lặp, giữ lần xem gần nhất)
    all_history = ViewHistory.objects.filter(
        user=request.user
    ).select_related('product', 'product__category').order_by('-viewed_at')
    
    # Lọc trùng: chỉ giữ lần xem gần nhất của mỗi sản phẩm
    seen_product_ids = set()
    view_history = []
    for vh in all_history:
        if vh.product_id not in seen_product_ids:
            seen_product_ids.add(vh.product_id)
            view_history.append(vh)
        if len(view_history) >= 10:
            break
    
    if not view_history:
        # Nếu chưa có lịch sử → gợi ý sản phẩm mới nhất
        recommended_products = list(Product.objects.filter(
            is_active=True
        ).order_by('-created_at')[:8])
        method = 'latest'
    else:
        # Lấy danh mục của các sản phẩm đã xem
        viewed_products = [vh.product for vh in view_history]
        viewed_product_ids = [p.id for p in viewed_products]
        viewed_categories = list(set([p.category_id for p in viewed_products]))
        
        # Gợi ý sản phẩm cùng danh mục (loại bỏ sản phẩm đã xem, loại bỏ trùng lặp)
        recommended_products = list(Product.objects.filter(
            is_active=True,
            category_id__in=viewed_categories
        ).exclude(
            id__in=viewed_product_ids
        ).distinct().order_by('-created_at')[:8])
        
        # Nếu không đủ 8 sản phẩm, thêm sản phẩm mới nhất
        if len(recommended_products) < 8:
            remaining = 8 - len(recommended_products)
            existing_ids = [p.id for p in recommended_products] + viewed_product_ids
            more_products = Product.objects.filter(
                is_active=True
            ).exclude(
                id__in=existing_ids
            ).order_by('-created_at')[:remaining]
            recommended_products.extend(list(more_products))
        
        method = 'category_based'
    
    context = {
        'recommended_products': recommended_products,
        'viewed_products': [vh.product for vh in view_history],
        'view_count': len(view_history) if view_history else 0,
        'method': method,
    }
    return render(request, 'shop/ai_recommendations.html', context)


# ===== WISHLIST VIEWS =====
@login_required
def wishlist_view(request):
    """Danh sách sản phẩm yêu thích"""
    wishlist_items = Wishlist.objects.filter(
        user=request.user
    ).select_related('product', 'product__category')
    
    context = {
        'wishlist_items': wishlist_items,
    }
    return render(request, 'shop/wishlist.html', context)


@login_required
def add_to_wishlist(request, product_id):
    """Thêm sản phẩm vào danh sách yêu thích"""
    product = get_object_or_404(Product, pk=product_id, is_active=True)
    
    wishlist_item, created = Wishlist.objects.get_or_create(
        user=request.user,
        product=product
    )
    
    if created:
        messages.success(request, f'Đã thêm "{product.name}" vào yêu thích!')
    else:
        messages.info(request, f'"{product.name}" đã có trong yêu thích!')
    
    # Quay lại trang trước
    next_url = request.GET.get('next', request.META.get('HTTP_REFERER', 'shop:home'))
    return redirect(next_url)


@login_required
def remove_from_wishlist(request, product_id):
    """Xóa sản phẩm khỏi danh sách yêu thích"""
    product = get_object_or_404(Product, pk=product_id)
    
    try:
        wishlist_item = Wishlist.objects.get(user=request.user, product=product)
        wishlist_item.delete()
        messages.success(request, f'Đã xóa "{product.name}" khỏi yêu thích!')
    except Wishlist.DoesNotExist:
        messages.warning(request, 'Sản phẩm không có trong yêu thích!')
    
    next_url = request.GET.get('next', request.META.get('HTTP_REFERER', 'shop:wishlist'))
    return redirect(next_url)


# ===== CHATBOT AI (Google Gemini) =====
import google.generativeai as genai


@csrf_exempt
@require_POST
def chatbot_api(request):
    """API endpoint cho chatbot AI - sử dụng Google Gemini"""
    try:
        data = json.loads(request.body)
        user_message = data.get('message', '').strip()
        conversation_history = data.get('history', [])

        if not user_message:
            return JsonResponse({'reply': 'Bạn chưa nhập tin nhắn!'}, status=400)

        # ===== TRUY VẤN DATABASE ĐỂ LẤY CONTEXT =====

        # 1) Lấy tất cả danh mục
        categories = Category.objects.all()
        category_info = ""
        for cat in categories:
            if cat.parent:
                category_info += f"  - {cat.name} (thuộc {cat.parent.name})\n"
            else:
                category_info += f"- {cat.name}\n"

        # 2) Tìm sản phẩm liên quan đến câu hỏi
        search_terms = user_message.lower().split()
        product_query = Q()
        for term in search_terms:
            if len(term) > 2:  # Bỏ qua từ quá ngắn
                product_query |= Q(name__icontains=term) | Q(description__icontains=term) | Q(category__name__icontains=term)

        matched_products = Product.objects.filter(
            product_query, is_active=True
        ).distinct()[:10] if product_query else Product.objects.none()

        product_info = ""
        if matched_products.exists():
            for p in matched_products:
                variants = p.variants.filter(is_available=True)
                sizes = list(set(v.size for v in variants if v.size))
                colors = list(set(v.get_color_display() for v in variants if v.color))
                stock_total = sum(v.stock for v in variants)
                product_info += (
                    f"- {p.name} | Giá: {int(p.price):,}đ | "
                    f"Danh mục: {p.category.name} | "
                    f"Size: {', '.join(sizes) if sizes else 'N/A'} | "
                    f"Màu: {', '.join(colors) if colors else 'N/A'} | "
                    f"Tồn kho: {stock_total} | "
                    f"Link: /products/{p.id}/\n"
                )

        # 3) Lấy tất cả sản phẩm (tóm tắt) nếu user hỏi chung
        all_products_summary = ""
        general_keywords = ['sản phẩm', 'bán gì', 'có gì', 'shop có', 'danh sách', 'tất cả', 'xem hàng', 'hàng mới']
        if any(kw in user_message.lower() for kw in general_keywords):
            all_products = Product.objects.filter(is_active=True).order_by('-created_at')[:20]
            for p in all_products:
                all_products_summary += f"- {p.name} | {int(p.price):,}đ | {p.category.name} | Link: /products/{p.id}/\n"

        # 4) Tra cứu đơn hàng (nếu user đã đăng nhập)
        order_info = ""
        if request.user.is_authenticated:
            order_keywords = ['đơn hàng', 'đơn', 'order', 'mua', 'đặt hàng', 'giao hàng', 'theo dõi', 'trạng thái đơn']
            if any(kw in user_message.lower() for kw in order_keywords):
                user_orders = Order.objects.filter(user=request.user).order_by('-created_at')[:5]
                if user_orders.exists():
                    status_map = dict(Order.STATUS_CHOICES)
                    for o in user_orders:
                        items = o.items.all()
                        items_str = ", ".join([f"{item.product.name} x{item.quantity}" for item in items])
                        order_info += (
                            f"- Đơn #{o.id} | Ngày: {o.created_at.strftime('%d/%m/%Y %H:%M')} | "
                            f"Trạng thái: {status_map.get(o.status, o.status)} | "
                            f"Tổng: {int(o.total_price):,}đ | "
                            f"Sản phẩm: {items_str}\n"
                        )
                else:
                    order_info = "Khách hàng chưa có đơn hàng nào.\n"

        # ===== XÂY DỰNG SYSTEM PROMPT =====
        system_prompt = f"""Bạn là trợ lý tư vấn thời trang AI của MC Shop — một shop thời trang trẻ trung, phong cách hiện đại.

THÔNG TIN VỀ SHOP:
- Tên: MC Shop
- Địa chỉ: 343 Xã Tân Dương, Phường Sa Đéc
- SĐT: 0869 288 871
- Facebook: facebook.com/19hoangminh02
- Instagram: instagram.com/minhlkc
- Thanh toán: QR Code (MB Bank), COD (thanh toán khi nhận hàng)

DANH MỤC SẢN PHẨM:
{category_info if category_info else "Chưa có thông tin danh mục."}

{"SẢN PHẨM TÌM ĐƯỢC LIÊN QUAN ĐẾN CÂU HỎI:" + chr(10) + product_info if product_info else ""}

{"TẤT CẢ SẢN PHẨM MỚI NHẤT:" + chr(10) + all_products_summary if all_products_summary else ""}

{"ĐƠN HÀNG CỦA KHÁCH:" + chr(10) + order_info if order_info else ""}

{"Khách hàng hiện đang đăng nhập với tên: " + request.user.username if request.user.is_authenticated else "Khách hàng chưa đăng nhập."}

QUY TẮC BẮT BUỘC:
1. Trả lời bằng tiếng Việt, thân thiện, vui vẻ, có emoji phù hợp.
2. Khi giới thiệu sản phẩm, LUÔN kèm link dạng [Tên sản phẩm](/products/ID/) để khách click xem.
3. Khi nói giá, format có dấu phẩy, VD: 299,000đ.
4. Tư vấn size: S (dưới 50kg), M (50-60kg), L (60-70kg), XL (70-80kg), XXL (trên 80kg) — chỉ là tham khảo.
5. Nếu khách hỏi về đơn hàng mà chưa đăng nhập, nhắc họ đăng nhập trước.
6. Nếu không tìm thấy sản phẩm phù hợp, gợi ý khách xem trang sản phẩm: /products/
7. NẾU KHÁCH HỎI CÂU KHÔNG LIÊN QUAN ĐẾN SHOP/THỜI TRANG/SẢN PHẨM/ĐƠN HÀNG (ví dụ: toán học, lịch sử, chính trị, vv), hãy trả lời: "Mình là chatbot của shop nên chỉ hỗ trợ về sản phẩm thôi nhé 😄 Bạn có thể hỏi mình về sản phẩm, size, đơn hàng hoặc chính sách shop!"
8. Chính sách shop:
   - Đổi trả trong 7 ngày nếu sản phẩm lỗi từ nhà sản xuất
   - Giao hàng toàn quốc, phí ship 30,000đ (miễn phí cho đơn trên 500,000đ)
   - Hỗ trợ qua Facebook, Instagram hoặc SĐT
9. Trả lời ngắn gọn, rõ ràng, không quá dài dòng. Tối đa 200 từ.
"""

        # ===== GỌI GEMINI API =====
        genai.configure(api_key=settings.GEMINI_API_KEY)
        model = genai.GenerativeModel('gemini-2.0-flash')

        # Xây dựng lịch sử hội thoại
        gemini_history = []
        for msg in conversation_history[-10:]:  # Giữ 10 tin nhắn gần nhất
            role = 'user' if msg.get('role') == 'user' else 'model'
            gemini_history.append({
                'role': role,
                'parts': [msg.get('content', '')]
            })

        # Tạo chat session
        chat = model.start_chat(history=gemini_history)

        # Gửi tin nhắn với system prompt đính kèm
        full_message = f"[SYSTEM INSTRUCTIONS - KHÔNG HIỂN THỊ CHO KHÁCH]\n{system_prompt}\n\n[TIN NHẮN CỦA KHÁCH HÀNG]\n{user_message}"

        response = chat.send_message(full_message)
        reply = response.text

        return JsonResponse({'reply': reply})

    except json.JSONDecodeError:
        return JsonResponse({'reply': 'Lỗi dữ liệu, vui lòng thử lại!'}, status=400)
    except Exception as e:
        print(f"Chatbot error: {e}")
        return JsonResponse({
            'reply': 'Xin lỗi, mình đang gặp sự cố. Bạn vui lòng thử lại sau nhé! 😅'
        }, status=500)