from django.shortcuts import render
import json
from .models import FilterCategory, Color, FilterList, Product, ProductSubCategory, ProductTeaser
from django.views import View
from django.http  import JsonResponse, HttpResponse

prefetch_mouse = ProductSubCategory.objects.prefetch_related('product_set')
mouse_thumbnail_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category = 1)
keyboard_thumbnail_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category = 3)
product_color_image = Product.objects.prefetch_related('product_thumbnail').filter(sub_category = 1).all()

class ProductDetailView(View):
	def post(self, request):
		product_name_input=json.loads(request.body)
		if Product.objects.filter(name=product_name_input['product_name']).exists():
			return JsonResponse({"Teaser":ProductTeaser.objects(product=Product.objects.filter(name=product_name_input['product_name'])[0].teaser)}, status = 200)

		return JsonResponse({"message":"INVALID_PRODUCT"}, status = 400)

class MouseListView(View):
    def get(self, request):
        try:
            mice = [
				{
        		'product_name'		: product.name,
				'product_id'		: product.id,
          		'description'		: product.description,
				'thumbnail_image'	: values.product_thumbnail.all()[0].thumbnail_image,
				'thumbnail_color'	: values.product_thumbnail.all()[0].thumbnail_background_color,
				'colors'			: [colorlist.colors.all()[i].color_image for i in range(0, len(colorlist.colors.all()),4)]
    			}
				for product,values,colorlist in zip(list(prefetch_mouse.get(id =1).product_set.all()), list(mouse_thumbnail_prefetch), mouse_thumbnail_prefetch.all() )
			]

            return JsonResponse({"data": mice}, status = 200)

        except KeyError:
            return JsonResponse({'massage': "INVALID_PRODUCT"}, status = 400)

class KeyboardListView(View):
	def get(self, request): 
		try:
			keyboards = [
				{'product_name'		: product.name,
     			'description'		: product.description,
				'thumbnail_image'	: values.product_thumbnail.all()[0].thumbnail_image,
				'thumbnail_color'	: values.product_thumbnail.all()[0].thumbnail_background_color}
				for product,values in zip(list(prefetch_mouse.get(id = 3).product_set.all()), list(keyboard_thumbnail_prefetch))]

			return JsonResponse({"data": keyboards}, status = 200)
		
		except KeyError:
			return JsonResponse({'massage': "INVALID_PRODUCT"}, status = 400)

class MouseFilterListView(View):
    def get(self, request):
        category_num = int(request.GET.get('filter'))
        mouse_filter_prefetch = FilterCategory.objects.filter(sub_category=1).prefetch_related('filterlist_set').all()
        try:
            filter_data = [
                {
				'product_name'		: product.name,
				'product_id'		: product.id,
    			'description'		: product.description, 
				'thumbnail_color'	: thumbnails.thumbnail_background_color,
				'thumbnail_image'	: thumbnails.thumbnail_image,
				'colors'			: [product.colors.all()[i].color_image for i in range(0, len(product.colors.all()),4)]
    			}
                for category in mouse_filter_prefetch for sub_category in category.filterlist_set.all().filter(id = category_num) for product in sub_category.product.all() for thumbnails in product.product_thumbnail.all()
                ]

            return JsonResponse({"data" : filter_data}, status = 200)
        
        except KeyError:
            return JsonResponse({"message": "INVALID_PRODUCT"}, status = 400)

class KeyboardFilterListView(View):
    def get(self, request):
        category_num = int(request.GET.get('filter'))
        mouse_filter_prefetch = FilterCategory.objects.filter(sub_category=3).prefetch_related('filterlist_set').all()
        try:
            filter_data = [
                {
				'product_name'		: product.name,
				'product_id'		: product.id,
    			'description'		: product.description, 
				'thumbnail_color'	: thumbnails.thumbnail_background_color,
				'thumbnail_image'	: thumbnails.thumbnail_image,
				'colors' 			: [product.colors.all()[i].color_image for i in range(0, len(product.colors.all()),4)]
    			}
                for category in mouse_filter_prefetch for sub_category in category.filterlist_set.all().filter(id = category_num) for product in sub_category.product.all() for thumbnails in product.product_thumbnail.all()
                ]

            return JsonResponse({"data" : filter_data}, status = 200)
        
        except KeyError:
            return JsonResponse({"message": "INVALID_PRODUCT"}, status = 400)

class TotalProductListForMain(View):
    def get(self,request):
        total_product_prefetch = Product.objects.prefetch_related('product_thumbnail').all()
        try:
            product_data = [
				{
					'product_name'		: product.name,
					'product_id'		: product.id,					
					'description'		: product.description,
					'thumbnail_color'	: thumbnails.thumbnail_background_color,
					'thumbnail_image'	: thumbnails.thumbnail_image
				} for product in total_product_prefetch for thumbnails in product.product_thumbnail.all()
			]            
            return JsonResponse( {'data': product_data}, status =200 )
        
        except KeyError:
            return JsonResponse( {"message" : "INVALIS REQUEST"} )