from django import template
from shop.models import Category

register = template.Library()

@register.inclusion_tag('shop/_navbar_categories.html')
def navbar_categories():
    parents = Category.objects.filter(parent__isnull=True).prefetch_related('subcategories')
    return {'parents': parents}
