from django.db import models
from product.models import *
from account.models import *


class OrderStatus(models.Model):
    name = models.CharField(max_length=50, null=True)

    class Meta:
        db_table='order_status'

class UserOrder(models.Model):
    order_item = models.ForeignKey('OrderItem', on_delete=models.CASCADE, null=True)
    order_time = models.DateField(auto_now_add=True)
    order_status = models.ForeignKey('OrderStatus', on_delete=models.CASCADE, null=True)
    address = models.CharField(max_length=16000, null=True)
    discounst = models.DecimalField(max_digits=4, decimal_places=2)
    final_price = models.DecimalField(max_digits=30, decimal_places=2)

    class Meta:
        db_table='user_orders'

class OrderItem(models.Model):
    user = models.ForeignKey('account.Account', on_delete=models.CASCADE, null=True)
    product_price = models.ForeignKey('product.ProductPrice', on_delete=models.CASCADE, null=True)
    product_color = models.ForeignKey('product.Color', on_delete=models.CASCADE, null=True)
    product_quantity = models.IntegerField(null=True)

    class Meta:
        db_table='order_items'
