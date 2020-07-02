from django.db import models

from product.models import (
    Product,
    ProductPrice
)

class Account(models.Model):
    email         = models.CharField(max_length=100, null = False)
    password      = models.CharField(max_length = 1500, null = False)
    first_name    = models.CharField(max_length = 100)
    last_name     = models.CharField(max_length = 100)
    created_at    = models.DateField(auto_now_add=True)

    class Meta:
        db_table = "accounts"

class UserProduct(models.Model):
    user = models.ForeignKey('Account', on_delete=models.CASCADE)
    registered_product  = models.ForeignKey('product.Product', on_delete=models.CASCADE)

    class Meta:
        db_table = "user_products"