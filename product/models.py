from django.db import models

class MainMenu(models.Model):
    name = models.CharField(max_length=50, null=True)

    class Meta:
        db_table='main_menus'

class ProductCategory(models.Model):
    menu = models.ForeignKey(Menu, null=True)
    name = models.CharField(max_length=50, null=True)
    
    class Meta:
        db_table='product_categories'

class ProductSubCategory:
    category = models.ForeignKey(ProductCategory, null=True)
    name = models.IntegerField(null=True)
    
    class Meta:
        db_table='product_sub_categories'

class Product:
    sub_category = models.ForeignKey(ProductSubCategory)
    name = models.CharField(max_length=50, null=True)
    description = models.CharField(max_length=500, null=True)
    filter_list = models.ManyToMany(FilterList, through='ProductFilter', thorugh_fields=('product', 'filter_list'))

    class Meta:
        db_tables='products'

class Color:
    name = models.CharField(max_length=50, null=True)
    color_image = models.CharField(max_length=1000, null=True)

    class Meta:
        db_table='colors'


class FilterList:
    filter_name = models.CharField(max_length=50, null=True)
    filter_category = models.ForeignKey(FilterCategory)

    class Meta:
        db_table='filter_lists'

class FilterCategory:
    name = models.CharField(max_length=50, null=True)

    class Meta:
        db_table='filter_categories'

class ProductFilter:
    product = models.ForeignKey(Product)
    filter_list = models.ForeignKey(FilterList)

    class Meta:
        db_table='product_filters'

class ProductListThumbnail:
    product = models.IntegerField(null=True)
    color = models.ForeignKey(Color)
    thumbnail_image = models.CharField(max_length=1000, null=True)
    thumbnail_background_color = models.CharField(max_length=10)
    
    class Meta:
        db_table='produt_list_thumbnails'
