import os
import django
import csv
import sys
from product.models import *
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "db_logitech.settings")
django.setup()

def practice(): #전체제품뷰
        product_lists=Product.objects.all()
        product_list={}
        for pl in product_lists:
                product_list.setdefault(pl.name, {"name":pl.name, "description":pl.description})
                colors=ProductImage.objects.filter(product=Product.objects.get(name=pl.name))
                colors_list=[c.color.name for c in colors]
                colors_new_list=[]
                color_images_list=[c.color.color_image for c in colors]
                color_images_new_list=[]
                thumbnail_img=ProductListThumbnail.objects.get(product=Product.objects.get(name=pl.name))
                i=0
                while i<=len(colors_list)-1:
                        if colors_list[i] not in colors_new_list:
                                colors_new_list.append(colors_list[i])
                        i+=1
                i=0
                while i<=len(colors_list)-1:
                        if color_images_list[i] not in color_images_new_list:
                                color_images_new_list.append(color_images_list[i])
                        i+=1
                product_list[pl.name].setdefault("color",colors_new_list)
                product_list[pl.name].setdefault("color_images",color_images_new_list)
                product_list[pl.name].setdefault("thumbnail_images",thumbnail_img.thumbnail_image)
                product_list[pl.name].setdefault("thumbnail_background_color",thumbnail_img.thumbnail_background_color)                      
        print (product_list)


