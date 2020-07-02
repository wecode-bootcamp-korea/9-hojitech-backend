from django.db import models

from product.models import (
    ProductPrice,
    Color
)
from account.models import Account


class OrderStatus(models.Model):
    name = models.CharField(max_length=50, null=True)

    class Meta:
        db_table='order_status'

class OrderItem(models.Model):
    user             = models.ForeignKey('account.Account', on_delete=models.CASCADE, null=True)
    product_price    = models.ForeignKey('product.ProductPrice', on_delete=models.CASCADE, null=True)
    product_color    = models.ForeignKey('product.Color', on_delete=models.CASCADE, null=True)
    order_status     = models.ForeignKey('OrderStatus', on_delete=models.CASCADE, null=True)
    product_quantity = models.IntegerField(null=True)
    order_time       = models.DateField(auto_now_add=True)

    class Meta:
        db_table='order_items'
