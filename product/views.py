import json
from .models import (
    FilterCategory,
    Color, 
	FilterList,
	Product,
    ProductSubCategory,
    ProductTeaser,
	Product,
	ProductImage)
from django.views import View
from django.http import (
	JsonResponse,
	HttpResponse
)

class MouseListView(View):
    def get(self, request):
        prefetch_mouse = ProductSubCategory.objects.prefetch_related('product_set')
        mouse_thumbnail_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category = 1)
        try:
            mice = [
				{
        		'product_name'		: product.name,
				'product_id'		: product.id,
          		'description'		: product.description,
				'thumbnail_image'	: values.product_thumbnail.all()[0].thumbnail_image,
				'thumbnail_color'	: values.product_thumbnail.all()[0].thumbnail_background_color,
				'colors'			: [
        								colorlist.colors.all()[i].color_image for i in range(0, len(colorlist.colors.all()),4)
                					]
    			}
				for product,values,colorlist in zip(list(prefetch_mouse.get(id =1).product_set.all()), list(mouse_thumbnail_prefetch), mouse_thumbnail_prefetch.all() )
			]

            return JsonResponse({"data": mice}, status = 200)

        except KeyError:
            return JsonResponse({'massage': "INVALID_PRODUCT"}, status = 400)

class KeyboardListView(View):
    def get(self, request): 
        prefetch_keyboard = ProductSubCategory.objects.prefetch_related('product_set')
        keyboard_thumbnail_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category = 3)
        try:
            keyboards = [
				{
				'product_name'		: product.name,
     			'description'		: product.description,
				'thumbnail_image'	: values.product_thumbnail.all()[0].thumbnail_image,
				'thumbnail_color'	: values.product_thumbnail.all()[0].thumbnail_background_color,
				'colors'			: [
        								colorlist.colors.all()[i].color_image for i in range(0, len(colorlist.colors.all()),4)
                					]
    			}
				for product,values,colorlist in zip(list(prefetch_keyboard.get(id = 3).product_set.all()), list(keyboard_thumbnail_prefetch), keyboard_thumbnail_prefetch.all())
    		]
            
            return JsonResponse({"data": keyboards}, status = 200)
        
        except KeyError:
            return JsonResponse({'massage': "INVALID_PRODUCT"}, status = 400)
		
class MouseFilterListView(View):
    def get(self, request):
        categoryId = request.GET.get('filter')
        mouse_filter_prefetch = FilterCategory.objects.filter(sub_category=1).prefetch_related('filterlist_set').all()
        try:
            filter_data = [
                {
				'product_name'		: product.name,
				'product_id'		: product.id,
    			'description'		: product.description, 
				'thumbnail_color'	: thumbnails.thumbnail_background_color,
				'thumbnail_image'	: thumbnails.thumbnail_image,
				'colors'			: [
        								product.colors.all()[i].color_image for i in range(0, len(product.colors.all()),4)
                					]
    			}
                for category in mouse_filter_prefetch for sub_category in category.filterlist_set.all().filter(id=categoryId) for product in sub_category.product.all() for thumbnails in product.product_thumbnail.all()
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
				'colors' 			: [
        								product.colors.all()[i].color_image for i in range(0, len(product.colors.all()),4)
                					]
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

class ProductDetailView(View):
	def get(self, request, product_id):

		specified_product_id=product_id

		if Product.objects.filter(id=specified_product_id).exists():
			specified_product = Product.objects.get(id=specified_product_id)

			product_name             = specified_product.name
			product_id               = specified_product.id
			product_name_description = specified_product.description

			product_images = ProductImage.objects.prefetch_related("color").filter(product=specified_product)
			colors         = []
			colors_image   = []
			for pi in product_images:
				if pi.color.name not in colors:
					colors.append(pi.color.name)
					colors_image.append(pi.color.color_image)

			product_image_list={}
			images=[]
			n=1
			for cl in colors:
				for pi in product_images:
					if pi.color.name==cl:
						if pi.image not in images:
							images.append(pi.image)
				product_image_list[f"color{n}"]=images
				n+=1
				images=[]

			product_videos        = [pv.video for pv in specified_product.productvideo_set.all()]
			product_price         = specified_product.productprice_set.get().price
			product_teaser        = specified_product.productteaser_set.get().teaser
			product_description   = specified_product.productdescription_set.get().description
			product_specification = specified_product.productspecification_set.get().specification
			recommend_product     = specified_product.recommend_product.all()
			recommend_name        = [r.name for r in recommend_product]
			recommend_description = [r.description for r in recommend_product]
			recommend_thumbnail   = [r.product_thumbnail.get().thumbnail_image for r in recommend_product]

			return JsonResponse({"product_name"                  : product_name,
								 "product_id"                    : product_id, 			 
								 "product_description"           : product_name_description, 
								 "price"                         : product_price, 
								 "color"                         : colors, 
								 "color_image"                   : colors_image, 
								 "product_images"                : product_image_list, 
								 "product_videos"                : product_videos, 
								 "Teaser"                        : product_teaser, 
								 "Description"                   : product_description, 
								 "specification"                 : product_specification, 
								 "recommend_product_name"        : recommend_name, 
								 "recommend_product_description" : recommend_description, 
								 "recommend_product_thumbnail"   : recommend_thumbnail }, status=200)
		return JsonResponse({"message": "Product does not exist"}, status=404)

class TestFilterListView(View):
	def get(self, request):
		if request.GET.get('filter') is None:
			category_num = {}
		else:
			category_num = {'category_num': int(request.GET.get('filter'))}
			print(category_num)
		mouse_filter_prefetch = FilterCategory.objects.filter(sub_category=3).prefetch_related('filterlist_set').all()

		try:
			filter_data = [
				{
				'product_name'		: product.name,
				'product_id'		: product.id,
    			'description'		: product.description, 
				'thumbnail_color'	: thumbnails.thumbnail_background_color,
				'thumbnail_image'	: thumbnails.thumbnail_image,
				'colors' 			: [
        								product.colors.all()[i].color_image for i in range(0, len(product.colors.all()),4)
                					]
    			}
                for category in mouse_filter_prefetch for sub_category in category.filterlist_set.all().prefetch_related('product').filter(**category_num) for product in sub_category.product.all() for thumbnails in product.product_thumbnail.all()
            ]

			return JsonResponse({"data" : filter_data}, status = 200)
        
		except KeyError:
			return JsonResponse({"message": "INVALID_PRODUCT"}, status = 400)