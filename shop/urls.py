from django.urls import path
from . import views

app_name = 'shop'

urlpatterns = [
    # Trang chủ
    path('', views.home, name='home'),
    
    # Danh sách sản phẩm
    path('products/', views.product_list, name='product_list'),
    
    # Chi tiết sản phẩm
    path('products/<int:pk>/', views.product_detail, name='product_detail'),
     # Authentication
     
    path('register/', views.register_view, name='register'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('profile/', views.profile_view, name='profile'),

    # Giỏ hàng
    path('cart/', views.cart_view, name='cart'),
    path('cart/add/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('cart/update/<int:item_id>/', views.update_cart, name='update_cart'),
    path('cart/remove/<int:item_id>/', views.remove_from_cart, name='remove_from_cart'),
    path('cart/clear/', views.clear_cart, name='clear_cart'),

    # Thanh toán & Đơn hàng
    path('checkout/', views.checkout, name='checkout'),
    path('order/create/', views.create_order, name='create_order'),
    path('payment/<int:order_id>/', views.payment_view, name='payment'),
    path('payment/<int:order_id>/confirm/', views.confirm_payment, name='confirm_payment'),
    path('orders/', views.order_list, name='order_list'),
    path('orders/<int:order_id>/', views.order_detail, name='order_detail'),
    
    # Admin
    path('statistics/', views.admin_statistics, name='admin_statistics'),
    
    # AI Recommendation
    path('recommendations/', views.ai_recommendations, name='ai_recommendations'),
    
    # ===== SEPAY WEBHOOK & PAYMENT API =====
    path('api/sepay-webhook/', views.sepay_webhook, name='sepay_webhook'),
    path('api/payment-status/<int:order_id>/', views.check_payment_status, name='check_payment_status'),
    
    # ===== WISHLIST (Sản phẩm yêu thích) =====
    path('wishlist/', views.wishlist_view, name='wishlist'),
    path('wishlist/add/<int:product_id>/', views.add_to_wishlist, name='add_to_wishlist'),
    path('wishlist/remove/<int:product_id>/', views.remove_from_wishlist, name='remove_from_wishlist'),

    # ===== CHATBOT AI =====
    path('api/chatbot/', views.chatbot_api, name='chatbot_api'),
]
