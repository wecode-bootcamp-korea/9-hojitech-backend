from django.shortcuts import render
import json
from .models import *
from django.views import View
from django.http import JsonResponse, HttpResponse

prefetch_mouse = ProductSubCategory.objects.prefetch_related('product_set')
mouse_thumbnail_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category=1)
keyboard_thumbnail_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category=3)
mouse_filter_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category=1).all()[0].filterlists.all().filter(filter_name='멀티 디바이스')
keyboard_filter_prefetch = Product.objects.prefetch_related('product_thumbnail').filter(sub_category=3).all()[0].filterlists.all().filter(filter_name='멀티 디바이스')

class ProductDetailView(View):
	def post(self, request):
		product_name_input = json.loads(request.body)
		product_images = ProductImage.objects.prefetch_related("color").filter(product=Product.objects.get(name=product_name_input["product_name"]))
		product_name=product_images[0].product.name
		product_description=product_images[0].product.description
		colors=[]
		colors_image=[]
		for pi in product_images:
			if pi.color.name not in colors:
				colors.append(pi.color.name)
				colors_image.append(pi.color.color_image)
		product_image_list={}
		images=[]
		for cl in colors:
			for pi in product_images:
				if pi.color.name==cl:
					if pi.image not in images:
						images.append(pi.image)
			product_image_list[cl]=images
			images=[]
		product_videos_list = ProductVideo.objects.prefetch_related("product").filter(product=Product.objects.get(name=product_name_input["product_name"]))
		product_videos = [pv.video for pv in product_videos_list]
		product_price = ProductPrice.objects.select_related("product").get(product=Product.objects.get(name=product_name_input["product_name"])).price
		p_teaser = ProductTeaser.objects.select_related("product").get(product=Product.objects.get(name=product_name_input["product_name"])).teaser
		p_description = ProductDescription.objects.select_related("product").get(product=Product.objects.get(name=product_name_input["product_name"])).description
		p_specification=ProductSpecification.objects.select_related("product").get(product=Product.objects.get(name=product_name_input["product_name"])).specification
		if Product.objects.filter(name=product_name_input["product_name"]).exists():
			return JsonResponse({"product_name": product_name, "product_description": product_description, "price": product_price, "color": colors, "color_image": colors_image, "product_images": product_image_list, "product_videos": product_videos, "Teaser": p_teaser, "Description": p_description, "specification": p_specification}, status=200)
		else:
			return JsonResponse({"message": "Wrong Product Name"}, status=400)


