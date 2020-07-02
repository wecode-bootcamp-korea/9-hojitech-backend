from django.db import models

from account.models import Account
from cart.models import OrderItem

class MainMenu(models.Model):
    name = models.CharField(max_length=50, null=True)

    class Meta:
        db_table='main_menus'

class ProductCategory(models.Model):
    menu = models.ForeignKey('MainMenu', on_delete=models.CASCADE, null=True)
    name = models.CharField(max_length=50, null=True)
    class Meta:
        db_table='product_categories'

class ProductSubCategory(models.Model):
    category = models.ForeignKey('ProductCategory', on_delete=models.CASCADE, null=True)
    name = models.CharField(max_length=50, null=True)
    
    class Meta:
        db_table='product_sub_categories'

class Product(models.Model):
    sub_category      = models.ForeignKey('ProductSubCategory', on_delete=models.CASCADE)
    name              = models.CharField(max_length=50, null=True)
    description       = models.CharField(max_length=500, null=True)
    filter_list       = models.ManyToManyField('FilterList', through='ProductFilter', related_name=('products'))
    color             = models.ManyToManyField('Color', through='ProductImage', related_name=('products'))
    recommend_product = models.ManyToManyField('self', through='RecommendProduct', symmetrical=False)

    class Meta:
        db_table='products'

class Color(models.Model):
    name        = models.CharField(max_length=50, null=True)
    color_image = models.CharField(max_length=1000, null=True)
    product     = models.ManyToManyField('Product', through='ProductImage', related_name=('colors'))

    class Meta:
        db_table='colors'

class FilterCategory(models.Model):
    name         = models.CharField(max_length=50, null=True)
    sub_category = models.ForeignKey('ProductSubCategory', on_delete=models.CASCADE, null=True)

    class Meta:
        db_table='filter_categories'

class FilterList(models.Model):
    filter_name     = models.CharField(max_length=50, null=True)
    filter_category = models.ForeignKey('FilterCategory', on_delete=models.CASCADE)
    product         = models.ManyToManyField('Product', through='ProductFilter', related_name=('filterlists'))


    class Meta:
        db_table='filter_lists'
        
class ProductFilter(models.Model):
    product     = models.ForeignKey('Product', on_delete=models.CASCADE)
    filter_list = models.ForeignKey('FilterList', on_delete=models.CASCADE)

    class Meta:
        db_table='product_filters'

class ProductListThumbnail(models.Model):
    product                    = models.ForeignKey('Product',on_delete=models.CASCADE,null=True, related_name="product_thumbnail")
    thumbnail_image            = models.CharField(max_length=1000, null=True)
    thumbnail_background_color = models.CharField(max_length=10, null=True)
    
    class Meta:
        db_table='product_list_thumbnails'

class ProductImage(models.Model):
    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    color   = models.ForeignKey('Color', on_delete=models.CASCADE)
    image   = models.CharField(max_length=10000, null=True)
    order   = models.IntegerField(null=True)

    class Meta:
        db_table='product_images'

class ProductTeaser(models.Model):
    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    teaser  = models.CharField(max_length=16000, null=True)
    order   = models.IntegerField(null=True)

    class Meta:
        db_table='product_teasers'

class ProductDescription(models.Model):
    product     = models.ForeignKey('Product', on_delete=models.CASCADE)
    description = models.CharField(max_length=16000, null=True)
    order       = models.IntegerField(null=True)

    class Meta:
        db_table='product_descriptions'

class ProductSpecification(models.Model):
    product       = models.ForeignKey('Product', on_delete=models.CASCADE)
    specification = models.CharField(max_length=16000, null=True)
    order         = models.IntegerField(null=True)

    class Meta:
        db_table='product_specifications'

class ProductVideo(models.Model):
    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    video   = models.CharField(max_length=16000, null=True)
    order   = models.IntegerField(null=True)

    class Meta:
        db_table='product_videos'

class RecommendProduct(models.Model):
    product           = models.ForeignKey('Product', on_delete=models.CASCADE, related_name='recommend_products')
    recommend_product = models.ForeignKey('Product', on_delete=models.CASCADE, related_name='products')

    class Meta:
        db_table='recommend_products'

class ProductPrice(models.Model):
    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    price   = models.IntegerField(null=True)
    user    = models.ManyToManyField('account.Account', through='cart.OrderItem', related_name=('products'))

    class Meta:
        db_table='product_prices'

