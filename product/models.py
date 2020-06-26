from django.db import models

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
    sub_category = models.ForeignKey('ProductSubCategory', on_delete=models.CASCADE)
    name = models.CharField(max_length=50, null=True)
    description = models.CharField(max_length=500, null=True)
    #filter_list = models.ManyToMany(FilterList, through='ProductFilter', thorugh_fields=('product', 'filter_list'))
    color = models.ManyToManyField('Color', )

    class Meta:
        db_table='products'

class Color(models.Model):
    name = models.CharField(max_length=50, null=True)
    color_image = models.CharField(max_length=1000, null=True)

    class Meta:
        db_table='colors'


class FilterList(models.Model):
    filter_name = models.CharField(max_length=50, null=True)
    filter_category = models.ForeignKey('FilterCategory', on_delete=models.CASCADE)

    class Meta:
        db_table='filter_lists'

class FilterCategory(models.Model):
    name = models.CharField(max_length=50, null=True)

    class Meta:
        db_table='filter_categories'

class ProductFilter(models.Model):
    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    filter_list = models.ForeignKey('FilterList', on_delete=models.CASCADE)

    class Meta:
        db_table='product_filters'

class ProductListThumbnail(models.Model):
    product = models.IntegerField(null=True)
    color = models.ForeignKey('Color', on_delete=models.CASCADE)
    thumbnail_image = models.CharField(max_length=1000, null=True)
    thumbnail_background_color = models.CharField(max_length=10)
    
    class Meta:
        db_table='produt_list_thumbnails'
