from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator
from django.utils import timezone


# Model Danh mục sản phẩm
class Category(models.Model):
    name = models.CharField(max_length=200, verbose_name="Tên danh mục")
    parent = models.ForeignKey(
        'self',
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        related_name='subcategories',
        verbose_name="Danh mục cha"
    )
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Ngày tạo")
    
    class Meta:
        verbose_name = "Danh mục"
        verbose_name_plural = "Danh mục"
        ordering = ['name']
        unique_together = ('name', 'parent')  # Tên không trùng trong cùng cấp
    
    def __str__(self):
        if self.parent:
            return f"{self.parent.name} > {self.name}"
        return self.name
    
    def get_all_products(self):
        """Lấy tất cả sản phẩm của danh mục này và danh mục con"""
        from django.db.models import Q
        if self.subcategories.exists():
            # Nếu là danh mục cha, lấy sản phẩm của tất cả danh mục con
            return Product.objects.filter(category__parent=self)
        else:
            # Nếu là danh mục con, lấy sản phẩm của chính nó
            return Product.objects.filter(category=self)

# Model Sản phẩm
class Product(models.Model):
    name = models.CharField(max_length=300, verbose_name="Tên sản phẩm")
    price = models.DecimalField(
        max_digits=10, 
        decimal_places=0,  
        validators=[MinValueValidator(0)],
        verbose_name="Giá"
    )
    description = models.TextField(verbose_name="Mô tả")
    image = models.ImageField(upload_to='products/', verbose_name="Hình ảnh")
    category = models.ForeignKey(
        Category, 
        on_delete=models.CASCADE, 
        related_name='products',
        verbose_name="Danh mục"
    )
    is_active = models.BooleanField(default=True, verbose_name="Đang bán")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Ngày tạo")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="Cập nhật")
    
    class Meta:
        verbose_name = "Sản phẩm"
        verbose_name_plural = "Sản phẩm"
        ordering = ['-created_at']
    
    def __str__(self):
        return self.name


# Model Biến thể sản phẩm (Size + Màu)
class ProductVariant(models.Model):
    """Biến thể sản phẩm: dùng cho quần áo có size và màu"""
    SIZE_CHOICES = [
        ('S', 'S'),
        ('M', 'M'),
        ('L', 'L'),
        ('XL', 'XL'),
        ('XXL', 'XXL'),
        ('freesize', 'Free Size'),
    ]
    
    COLOR_CHOICES = [
        ('white', 'Trắng'),
        ('black', 'Đen'),
        ('red', 'Đỏ'),
        ('blue', 'Xanh dương'),
        ('navy', 'Xanh navy'),
        ('gray', 'Xám'),
        ('beige', 'Be'),
        ('pink', 'Hồng'),
        ('yellow', 'Vàng'),
        ('green', 'Xanh lá'),
        ('brown', 'Nâu'),
    ]
    
    product = models.ForeignKey(
        Product, 
        on_delete=models.CASCADE, 
        related_name='variants',
        verbose_name="Sản phẩm"
    )
    size = models.CharField(
        max_length=20, 
        choices=SIZE_CHOICES,
        blank=True,
        null=True,
        verbose_name="Size"
    )
    color = models.CharField(
        max_length=50, 
        choices=COLOR_CHOICES,
        blank=True,
        null=True,
        verbose_name="Màu sắc"
    )
    stock = models.PositiveIntegerField(
        default=0,
        verbose_name="Số lượng tồn kho"
    )
    is_available = models.BooleanField(
        default=True,
        verbose_name="Còn hàng"
    )
    image = models.ImageField(
        upload_to='products/variants/',
        blank=True,
        null=True,
        verbose_name="Hình ảnh biến thể"
    )
    
    class Meta:
        verbose_name = "Biến thể sản phẩm"
        verbose_name_plural = "Biến thể sản phẩm"
        unique_together = ('product', 'size', 'color')  # Không trùng lặp
    
    def __str__(self):
        parts = [self.product.name]
        if self.size:
            parts.append(f"Size {self.size}")
        if self.color:
            parts.append(self.get_color_display())
        return " - ".join(parts)


# Model Giỏ hàng
class Cart(models.Model):
    user = models.OneToOneField(
        User, 
        on_delete=models.CASCADE, 
        related_name='cart',
        verbose_name="Người dùng"
    )
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Ngày tạo")
    
    class Meta:
        verbose_name = "Giỏ hàng"
        verbose_name_plural = "Giỏ hàng"
    
    def __str__(self):
        return f"Giỏ hàng của {self.user.username}"
    
    def get_total(self):
        """Tính tổng tiền trong giỏ hàng"""
        return sum(item.get_subtotal() for item in self.items.all())


# Model Chi tiết giỏ hàng
class CartItem(models.Model):
    cart = models.ForeignKey(
        Cart, 
        on_delete=models.CASCADE, 
        related_name='items',
        verbose_name="Giỏ hàng"
    )
    product = models.ForeignKey(
        Product, 
        on_delete=models.CASCADE,
        verbose_name="Sản phẩm"
    )
    variant = models.ForeignKey(
        ProductVariant,
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        verbose_name="Biến thể (size/màu)"
    )
    quantity = models.PositiveIntegerField(
        default=1,
        validators=[MinValueValidator(1)],
        verbose_name="Số lượng"
    )
    added_at = models.DateTimeField(auto_now_add=True, verbose_name="Ngày thêm")
    
    class Meta:
        verbose_name = "Sản phẩm trong giỏ"
        verbose_name_plural = "Sản phẩm trong giỏ"
        unique_together = ('cart', 'product', 'variant')
    
    def __str__(self):
        if self.variant:
            return f"{self.quantity} x {self.product.name} ({self.variant})"
        return f"{self.quantity} x {self.product.name}"
    
    def get_subtotal(self):
        """Tính thành tiền của sản phẩm"""
        return self.product.price * self.quantity


# Model Đơn hàng
class Order(models.Model):
    STATUS_CHOICES = [
        ('pending', 'Chờ thanh toán'),
        ('paid', 'Đã thanh toán'),
        ('processing', 'Đang xử lý'),
        ('shipping', 'Đang giao'),
        ('completed', 'Hoàn thành'),
        ('cancelled', 'Đã hủy'),
    ]
    
    user = models.ForeignKey(
        User, 
        on_delete=models.CASCADE, 
        related_name='orders',
        verbose_name="Người đặt"
    )
    total_price = models.DecimalField(
        max_digits=10, 
        decimal_places=0,
        verbose_name="Tổng tiền"
    )
    status = models.CharField(
        max_length=20, 
        choices=STATUS_CHOICES, 
        default='pending',
        verbose_name="Trạng thái"
    )
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Ngày đặt")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="Cập nhật")
    
    class Meta:
        verbose_name = "Đơn hàng"
        verbose_name_plural = "Đơn hàng"
        ordering = ['-created_at']
    
    def __str__(self):
        return f"Đơn #{self.id} - {self.user.username}"


# Model Chi tiết đơn hàng
class OrderItem(models.Model):
    order = models.ForeignKey(
        Order, 
        on_delete=models.CASCADE, 
        related_name='items',
        verbose_name="Đơn hàng"
    )
    product = models.ForeignKey(
        Product, 
        on_delete=models.CASCADE,
        verbose_name="Sản phẩm"
    )
    variant = models.ForeignKey(
        ProductVariant,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        verbose_name="Biến thể (size/màu)"
    )
    quantity = models.PositiveIntegerField(verbose_name="Số lượng")
    price = models.DecimalField(
        max_digits=10, 
        decimal_places=0,
        verbose_name="Giá tại thời điểm mua"
    )
    
    class Meta:
        verbose_name = "Chi tiết đơn hàng"
        verbose_name_plural = "Chi tiết đơn hàng"
    
    def __str__(self):
        if self.variant:
            return f"{self.quantity} x {self.product.name} ({self.variant})"
        return f"{self.quantity} x {self.product.name}"
    
    def get_subtotal(self):
        """Tính thành tiền"""
        return self.price * self.quantity


# Model Thanh toán
class Payment(models.Model):
    METHOD_CHOICES = [
        ('qr_code', 'QR Code'),
        ('cod', 'COD'),
    ]
    
    STATUS_CHOICES = [
        ('pending', 'Chờ thanh toán'),
        ('completed', 'Đã thanh toán'),
        ('failed', 'Thất bại'),
    ]
    
    order = models.OneToOneField(
        Order, 
        on_delete=models.CASCADE, 
        related_name='payment',
        verbose_name="Đơn hàng"
    )
    method = models.CharField(
        max_length=20, 
        choices=METHOD_CHOICES,
        verbose_name="Phương thức"
    )
    status = models.CharField(
        max_length=20, 
        choices=STATUS_CHOICES, 
        default='pending',
        verbose_name="Trạng thái"
    )
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Ngày tạo")
    
    # ===== THÊM MỚI CHO SEPAY =====
    reference_code = models.CharField(
        max_length=50, 
        unique=True, 
        blank=True, 
        null=True,
        verbose_name="Mã tham chiếu"
    )  # VD: "DH123" - nội dung chuyển khoản
    
    transaction_id = models.CharField(
        max_length=100, 
        blank=True, 
        null=True,
        verbose_name="Mã giao dịch SePay"
    )  # ID từ SePay webhook
    
    paid_at = models.DateTimeField(
        blank=True, 
        null=True,
        verbose_name="Thời gian thanh toán"
    )
    
    class Meta:
        verbose_name = "Thanh toán"
        verbose_name_plural = "Thanh toán"
    
    def __str__(self):
        return f"Thanh toán #{self.order.id}"


# Model Lịch sử xem sản phẩm (cho AI recommendation)
class ViewHistory(models.Model):
    user = models.ForeignKey(
        User, 
        on_delete=models.CASCADE, 
        related_name='view_history',
        verbose_name="Người dùng"
    )
    product = models.ForeignKey(
        Product, 
        on_delete=models.CASCADE,
        verbose_name="Sản phẩm"
    )
    viewed_at = models.DateTimeField(default=timezone.now, verbose_name="Thời gian xem")
    
    class Meta:
        verbose_name = "Lịch sử xem"
        verbose_name_plural = "Lịch sử xem"
        ordering = ['-viewed_at']
    
    def __str__(self):
        return f"{self.user.username} xem {self.product.name}"


# Model Sản phẩm yêu thích
class Wishlist(models.Model):
    user = models.ForeignKey(
        User, 
        on_delete=models.CASCADE, 
        related_name='wishlist',
        verbose_name="Người dùng"
    )
    product = models.ForeignKey(
        Product, 
        on_delete=models.CASCADE,
        verbose_name="Sản phẩm"
    )
    added_at = models.DateTimeField(auto_now_add=True, verbose_name="Ngày thêm")
    
    class Meta:
        verbose_name = "Sản phẩm yêu thích"
        verbose_name_plural = "Sản phẩm yêu thích"
        unique_together = ('user', 'product')
        ordering = ['-added_at']
    
    def __str__(self):
        return f"{self.user.username} thích {self.product.name}"