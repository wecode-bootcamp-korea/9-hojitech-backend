# Generated by Django 3.0.7 on 2020-06-26 04:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0006_remove_productlistthumbnail_color'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProductImage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.CharField(max_length=10000, null=True)),
                ('order', models.IntegerField(null=True)),
                ('color', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.Color')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='product.Product')),
            ],
            options={
                'db_table': 'product_images',
            },
        ),
    ]