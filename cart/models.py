from django.db import models

from product.models import (
    ProductPrice,
    Color
)
from account.models import *


class OrderStatus(models.Model):
    name = models.CharField(max_length=50, null=True)

    class Meta:
        db_table='order_status'

class OrderItem(models.Model):
    user_order       = models.ForeignKey('UserOrder', on_delete=models.CASCADE, null=True)
    product_price    = models.ForeignKey('product.ProductPrice', on_delete=models.CASCADE, null=True)
    product_color    = models.ForeignKey('product.Color', on_delete=models.CASCADE, null=True)
    product_quantity = models.IntegerField(null=True)

    class Meta:
        db_table='order_items'

class UserOrder(models.Model):
    user             = models.ForeignKey('account.Account', on_delete=models.CASCADE, null=True)
    discount         = models.DecimalField(max_digits=4, decimal_places=2, null=True)
    final_price      = models.DecimalField(max_digits=30, decimal_places=2, null=True)
    order_status     = models.ForeignKey('OrderStatus', on_delete=models.CASCADE, null=True)
    order_time       = models.DateField(auto_now_add=True)
    address          = models.ForeignKey('UserDeliveryAddress', on_delete=models.CASCADE, null=True)  

    class Meta:
        db_table='user_orders'

class UserDeliveryAddress(models.Model):
    user             = models.ForeignKey('account.Account', on_delete=models.CASCADE, null=True)
    address          = models.CharField(max_length=1000, null=True)

    class Meta:
        db_table='user_deilivery_address'
