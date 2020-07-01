from django.db import models
from product.models import *
from cart.models import *

class Account(models.Model):
    email           =       models.CharField(max_length=100, null = False)
    password        =       models.CharField(max_length = 1500, null = False)
    first_name      =       models.CharField(max_length = 100)
    last_name       =       models.CharField(max_length = 100)
    created_at      =       models.DateField(auto_now_add=True)
    product_price = models.ManyToManyField('product.ProductPrice', through='cart.OrderItem', related_name=('accounts'))

    class Meta:
        db_table    =       "accounts"

class UserProduct(models.Model):
    user = models.ForeignKey('Account', on_delete=models.CASCADE)
    registered_product  = models.ForeignKey('product.Product', on_delete=models.CASCADE)

    class Meta:
        db_table    =   "user_products"