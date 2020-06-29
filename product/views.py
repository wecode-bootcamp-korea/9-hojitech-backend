from django.shortcuts import render
import json
from .models import *
from django.views import View
from django.http  import JsonResponse, HttpResponse

prefetch_mouse = ProductSubCategory.objects.prefetch_related('product_set')
mouse_thumbnail_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category=1)
keyboard_thumbnail_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category=3)
mouse_filter_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category=1).all()[0].filterlists.all().filter(filter_name='멀티 디바이스')
keyboard_filter_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category=3).all()[0].filterlists.all().filter(filter_name='멀티 디바이스')

class ProductDetailView(View):
	def post(self, request):
		product_name_input=json.loads(request.body)
		if Product.objects.filter(name=product_name_input['product_name']).exists():
			return JsonResponse({"Teaser":ProductTeaser.objects(product=Product.objects.filter(name=product_name_input['product_name'])[0].teaser)}, status=200)
		else:
			return JsonResponse({"message":"Wrong Product Name"}, status=400)

class MouseListView(View):
    def get(self, request):
        try:
            mice = [
				{
        		'product_name' : product.name, 'description' : product.description,
				'thumbnail_image' : values.product_thumbnail.all()[0].thumbnail_image,
				'thumbnail_color' : values.product_thumbnail.all()[0].thumbnail_background_color
    			}
				for product,values in zip(list(prefetch_mouse.get(id =1).product_set.all()), list(mouse_thumbnail_prefetch))
				and {'colors' : color.color_image} for color in mouse_filter_prefetch
    		]
            return JsonResponse({"data": mice}, status = 200)
        except KeyError:
            return JsonResponse({'massage': "product does not exists"}, status =400)

class KeyboardListView(View):
	def get(self, request):
		try:
			keyboards = [
				{'product_name' : product.name, 'description' : product.description,
				'thumbnail_image' : values.product_thumbnail.all()[0].thumbnail_image,
				'thumbnail_color' : values.product_thumbnail.all()[0].thumbnail_background_color}
				for product,values in zip(list(prefetch_mouse.get(id =3).product_set.all()), list(keyboard_thumbnail_prefetch))]
			return JsonResponse({"data": keyboards}, status = 200)
		except KeyError:
			return JsonResponse({'massage': "product does not exists"}, status =400)

class MouseFilterListView(View):
	def get(self, request):	
		# data =  json.loads(request.body)
		try:
			filter_data = [
				{
				'product_name' : products.name, 'description' : products.description, 
				'thumbnail_color' : thumbnails.thumbnail_background_color,
				'thumbnail_image': thumbnails.thumbnail_image}
				for filter_name in mouse_filter_prefetch for products in filter_name.product.all() for thumbnails in products.product_thumbnail.all()					
			]
			return JsonResponse({"data" : filter_data})
		except KeyError:
			return JsonResponse({"message": "product does not exists"}, status = 400)