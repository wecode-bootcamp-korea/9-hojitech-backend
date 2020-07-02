import json

from django.shortcuts import render
from django.views import View
from django.http import (
	JsonResponse,
	HttpResponse
)

from .models import (
	Product,
	ProductImage
)

class ProductDetailView(View):
	def get(self, request, product_id):

		specified_product_id=product_id

		if Product.objects.filter(id=specified_product_id).exists():
			specified_product = Product.objects.get(id=specified_product_id)

			product_name             = specified_product.name
			product_id               = specified_product.id
			product_name_description = specified_product.description

			product_images = ProductImage.objects.prefetch_related("color").filter(product=specified_product)
			colors         =[]
			colors_image   =[]
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
