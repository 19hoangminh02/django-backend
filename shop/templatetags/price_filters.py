from django import template

register = template.Library()


@register.filter(name='vnd_format')
def vnd_format(value):
    """Format number with comma thousand separators: 399000 -> 399,000"""
    try:
        value = int(float(value))
        return f'{value:,}'
    except (ValueError, TypeError):
        return value
