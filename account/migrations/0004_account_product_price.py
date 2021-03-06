# Generated by Django 3.0.7 on 2020-07-01 01:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0013_merge_20200629_2132'),
        ('cart', '0003_orderitem_product_color'),
        ('account', '0003_userproduct'),
    ]

    operations = [
        migrations.AddField(
            model_name='account',
            name='product_price',
            field=models.ManyToManyField(related_name='accounts', through='cart.OrderItem', to='product.ProductPrice'),
        ),
    ]
