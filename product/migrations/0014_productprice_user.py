# Generated by Django 3.0.7 on 2020-07-01 01:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0004_account_product_price'),
        ('cart', '0003_orderitem_product_color'),
        ('product', '0013_merge_20200629_2132'),
    ]

    operations = [
        migrations.AddField(
            model_name='productprice',
            name='user',
            field=models.ManyToManyField(related_name='products', through='cart.OrderItem', to='account.Account'),
        ),
    ]
