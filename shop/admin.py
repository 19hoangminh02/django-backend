from django.contrib import admin
from django.utils.html import format_html
from django.forms import BaseInlineFormSet
from django.core.exceptions import ValidationError
from .models import (
    Category, 
    Product, 
    ProductVariant,
    Cart, 
    CartItem, 
    Order, 
    OrderItem, 
    Payment, 
    ViewHistory,
    Wishlist,
    Coupon
)


# ===== ADMIN CHO CATEGORY =====
@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'parent', 'product_count', 'created_at')
    search_fields = ('name',)
    list_filter = ('parent',)
    ordering = ('parent', 'name')
    
    def product_count(self, obj):
        return obj.products.count()
    product_count.short_description = 'Số SP'


# ===== ADMIN CHO PRODUCT VARIANT (Inline) =====
class ProductVariantInlineFormSet(BaseInlineFormSet):
    def clean(self):
        super().clean()
        seen = set()
        for form in self.forms:
            if form.cleaned_data and not form.cleaned_data.get('DELETE', False):
                size = form.cleaned_data.get('size')
                color = form.cleaned_data.get('color')
                key = (size, color)
                if key in seen:
                    raise ValidationError(
                        f'Biến thể trùng lặp: Size={size}, Màu={color}. '
                        f'Mỗi tổ hợp size + màu chỉ được phép tồn tại 1 lần.'
                    )
                seen.add(key)


class ProductVariantInline(admin.TabularInline):
    model = ProductVariant
    extra = 1
    fields = ('size', 'color', 'stock', 'is_available', 'image')
    formset = ProductVariantInlineFormSet


# ===== ADMIN CHO PRODUCT =====
@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('image_preview', 'name', 'category', 'price_display', 'is_active', 'created_at')
    list_display_links = ('image_preview', 'name')
    list_filter = ('category', 'is_active', 'created_at')
    search_fields = ('name', 'description')
    list_editable = ('is_active',)
    ordering = ('-created_at',)
    readonly_fields = ('created_at', 'updated_at', 'image_preview_large')
    list_per_page = 20
    
    fieldsets = (
        ('Thông tin cơ bản', {
            'fields': ('name', 'category', 'price')
        }),
        ('Hình ảnh', {
            'fields': ('image', 'image_preview_large')
        }),
        ('Mô tả', {
            'fields': ('description',),
            'classes': ('collapse',)
        }),
        ('Trạng thái', {
            'fields': ('is_active', 'created_at', 'updated_at')
        }),
    )
    
    inlines = [ProductVariantInline]
    
    def image_preview(self, obj):
        if obj.image:
            return format_html('<img src="{}" style="width: 50px; height: 50px; object-fit: cover; border-radius: 5px;"/>', obj.image.url)
        return "-"
    image_preview.short_description = 'Ảnh'
    
    def image_preview_large(self, obj):
        if obj.image:
            return format_html('<img src="{}" style="max-width: 200px; max-height: 200px; object-fit: cover;"/>', obj.image.url)
        return "Chưa có ảnh"
    image_preview_large.short_description = 'Xem trước'
    
    def price_display(self, obj):
        try:
            price = float(obj.price)
            return format_html('<span style="color: #e74c3c; font-weight: bold;">{} đ</span>', f'{price:,.0f}')
        except (ValueError, TypeError):
            return obj.price
    price_display.short_description = 'Giá'


# ===== ADMIN CHO PRODUCT VARIANT =====
@admin.register(ProductVariant)
class ProductVariantAdmin(admin.ModelAdmin):
    list_display = ('product', 'size', 'color', 'stock', 'stock_status', 'is_available', 'image_preview')
    list_filter = ('size', 'color', 'is_available', 'product__category')
    search_fields = ('product__name',)
    list_editable = ('stock', 'is_available')
    list_per_page = 30
    
    def stock_status(self, obj):
        if obj.stock == 0:
            return format_html('<span style="color: red;">Hết hàng</span>')
        elif obj.stock < 10:
            return format_html('<span style="color: orange;">Sắp hết ({})</span>', obj.stock)
        return format_html('<span style="color: green;">Còn hàng ({})</span>', obj.stock)
    stock_status.short_description = 'Tình trạng'

    def image_preview(self, obj):
        if obj.image:
            return format_html('<img src="{}" style="width: 40px; height: 40px; object-fit: cover; border-radius: 4px;"/>', obj.image.url)
        return "-"
    image_preview.short_description = 'Ảnh'


# ===== ADMIN CHO ORDER ITEM (Inline) =====
class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 0
    fields = ('product', 'variant', 'quantity', 'price', 'subtotal_display')
    readonly_fields = ('product', 'variant', 'quantity', 'price', 'subtotal_display')
    can_delete = False
    
    def subtotal_display(self, obj):
        if obj.pk:
            return f"{obj.get_subtotal():,.0f} đ"
        return "-"
    subtotal_display.short_description = 'Thành tiền'


# ===== ADMIN CHO PAYMENT (Inline) =====
class PaymentInline(admin.StackedInline):
    model = Payment
    extra = 0
    fields = ('method', 'status', 'reference_code', 'transaction_id', 'paid_at', 'created_at')
    readonly_fields = ('reference_code', 'transaction_id', 'paid_at', 'created_at')
    can_delete = False


# ===== ADMIN CHO COUPON =====
@admin.register(Coupon)
class CouponAdmin(admin.ModelAdmin):
    list_display = ('code', 'discount_type', 'discount_value', 'max_discount', 'min_order_value', 'usage_status', 'is_active', 'expires_at')
    list_filter = ('discount_type', 'is_active')
    search_fields = ('code',)
    list_editable = ('is_active',)
    ordering = ('-created_at',)
    list_per_page = 25
    
    def usage_status(self, obj):
        if obj.usage_limit == 0:
            return format_html('<span style="color: green;">{} đã dùng (không giới hạn)</span>', obj.used_count)
        return format_html('{}/{}', obj.used_count, obj.usage_limit)
    usage_status.short_description = 'Sử dụng'


# ===== ADMIN CHO ORDER =====
@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('order_id', 'user', 'fullname', 'phone', 'total_display', 'payment_method', 'status', 'payment_status', 'created_at')
    list_filter = ('status', 'payment_method', 'created_at')
    search_fields = ('user__username', 'id', 'fullname', 'phone')
    list_editable = ('status',)
    ordering = ('-created_at',)
    readonly_fields = ('created_at', 'updated_at')
    list_per_page = 25
    date_hierarchy = 'created_at'
    
    fieldsets = (
        ('Thông tin khách hàng', {
            'fields': ('user', 'fullname', 'phone', 'address', 'note')
        }),
        ('Thanh toán', {
            'fields': ('payment_method', 'total_price', 'discount', 'shipping_fee', 'coupon', 'status')
        }),
        ('Thời gian', {
            'fields': ('created_at', 'updated_at')
        }),
    )
    
    inlines = [OrderItemInline, PaymentInline]
    
    def order_id(self, obj):
        return format_html('<strong>#{}</strong>', obj.id)
    order_id.short_description = 'Mã ĐH'
    
    def total_display(self, obj):
        return format_html('<span style="color: #e74c3c; font-weight: bold;">{:,.0f} đ</span>', obj.total_price)
    total_display.short_description = 'Tổng tiền'
    
    def status_badge(self, obj):
        colors = {
            'pending': '#f39c12',
            'paid': '#27ae60',
            'processing': '#3498db',
            'shipping': '#9b59b6',
            'completed': '#2c3e50',
            'cancelled': '#e74c3c',
        }
        color = colors.get(obj.status, '#95a5a6')
        return format_html(
            '<span style="background: {}; color: white; padding: 3px 10px; border-radius: 10px; font-size: 11px;">{}</span>',
            color, obj.get_status_display()
        )
    status_badge.short_description = 'Trạng thái'
    
    def payment_status(self, obj):
        try:
            payment = obj.payment
            if payment.status == 'completed':
                return format_html('<span style="color: green;">✓ Đã TT</span>')
            elif payment.status == 'pending':
                return format_html('<span style="color: orange;">⏳ Chờ TT</span>')
            else:
                return format_html('<span style="color: red;">✗ Thất bại</span>')
        except:
            return "-"
    payment_status.short_description = 'Thanh toán'


# ===== ADMIN CHO PAYMENT =====
@admin.register(Payment)
class PaymentAdmin(admin.ModelAdmin):
    list_display = ('order', 'method', 'status_badge', 'reference_code', 'paid_at', 'created_at')
    list_filter = ('method', 'status', 'created_at')
    search_fields = ('order__id', 'reference_code', 'transaction_id')
    readonly_fields = ('created_at', 'paid_at')
    list_per_page = 25
    
    def status_badge(self, obj):
        colors = {
            'pending': '#f39c12',
            'completed': '#27ae60',
            'failed': '#e74c3c',
        }
        color = colors.get(obj.status, '#95a5a6')
        return format_html(
            '<span style="background: {}; color: white; padding: 3px 8px; border-radius: 5px;">{}</span>',
            color, obj.get_status_display()
        )
    status_badge.short_description = 'Trạng thái'


# ===== ADMIN CHO WISHLIST =====
@admin.register(Wishlist)
class WishlistAdmin(admin.ModelAdmin):
    list_display = ('user', 'product', 'added_at')
    list_filter = ('added_at',)
    search_fields = ('user__username', 'product__name')
    ordering = ('-added_at',)
    list_per_page = 30


# ===== ADMIN CHO VIEW HISTORY =====
@admin.register(ViewHistory)
class ViewHistoryAdmin(admin.ModelAdmin):
    list_display = ('user', 'product', 'viewed_at')
    list_filter = ('viewed_at',)
    search_fields = ('user__username', 'product__name')
    ordering = ('-viewed_at',)
    readonly_fields = ('viewed_at',)
    list_per_page = 50


# ===== KHÔNG CẦN HIỂN THỊ CART TRONG ADMIN =====
# Cart được quản lý tự động bởi user


# ===== TÙY CHỈNH GIAO DIỆN ADMIN =====
admin.site.site_header = "🛍️ Fashion Shop Admin"
admin.site.site_title = "Fashion Shop"
admin.site.index_title = "Quản lý cửa hàng thời trang"