import os
import django
from datetime import timedelta

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'fashion_shop_project.settings')
django.setup()

from shop.models import Order
from django.utils import timezone
from django.db.models.functions import ExtractYear, ExtractMonth, ExtractDay
from django.db.models import Sum

today = timezone.now()
thirty_days_ago = today - timedelta(days=30)
paid_statuses = ['paid', 'completed', 'processing', 'shipping']

orders = Order.objects.all()
print(f"Total orders overall: {orders.count()}")
for o in orders:
    print(f"Order {o.id:3} | Status: {o.status:12} | Created at: {o.created_at} | Total: {o.total_price}")

print("="*40)
print(f"Time range: {thirty_days_ago} -> {today}")
recent_orders = Order.objects.filter(created_at__gte=thirty_days_ago, status__in=paid_statuses)
print(f"Total valid recent orders: {recent_orders.count()}")

daily_qs = list(
    recent_orders
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

print(daily_qs)

