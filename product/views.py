from django.shortcuts import render
import json
from .models import *
from django.views import View
from django.http import JsonResponse, HttpResponse

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

class ProductListView(View):
	def post(self, request):
		product_name_input = json.loads(request.body)
		input_key_lists = product_name_input.keys()
		if 'subcategory' not in input_key_lists:
			subcategories_all=ProductSubCategory.objects.prefetch_related("category")
			subcategories=[]
			for sc in subcategories_all:
				if sc.category.name==product_name_input["category"]:
					subcategories.append(sc)
			product_lists=[]
			for subcategory in subcategories:
				for plist in Product.objects.filter(sub_category=subcategory):
					product_lists.append(plist)
			#print(product_lists)
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
			#return JsonResponse({"message": product_list}, status=200)
			return JsonResponse(product_list, status=200)

		elif 'subcategory' in input_key_lists:
			product_lists=Product.objects.filter(sub_category=ProductSubCategory.objects.get(name=product_name_input["subcategory"], category=ProductCategory.objects.get(name=product_name_input["category"])))
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
			#return JsonResponse({"message": product_list}, status=200)
			return JsonResponse(product_list, status=200)


class ProductFilterView(View):
	def post(self, request):
		product_name_input = json.loads(request.body)
		product_lists=[]
		product_sub_category=ProductSubCategory.objects.get(name=product_name_input["subcategory"])
		specified_filter_category=FilterCategory.objects.filter(sub_category=ProductSubCategory.objects.get(name=product_name_input["subcategory"]))
		#filters_list=FilterList.objects.filter(filter_name=product_name_input["filtername"])
		specified_filter_list=[]
		for sfc in specified_filter_category:
			specified_filters=FilterList.objects.filter(filter_name=product_name_input["filtername"], filter_category=sfc)
			for sf in specified_filters:
				if sf not in specified_filter_list:
					specified_filter_list.append(sf)
		product_names=[]
		for sfl in specified_filter_list:
			product_filters=ProductFilter.objects.filter(filter_list=sfl)
			for pf in product_filters:
				product_lists.append(pf)
		#print(product_lists)
		product_list={}
		for pl in product_lists:
			product_list.setdefault(pl.product.name, {"name":pl.product.name, "description":pl.product.description})
			colors=ProductImage.objects.filter(product=Product.objects.get(name=pl.product.name))
			colors_list=[c.color.name for c in colors]
			colors_new_list=[]
			color_images_list=[c.color.color_image for c in colors]
			color_images_new_list=[]
			thumbnail_img=ProductListThumbnail.objects.get(product=Product.objects.get(name=pl.product.name))
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
			product_list[pl.product.name].setdefault("color",colors_new_list)
			product_list[pl.product.name].setdefault("color_images",color_images_new_list)
			product_list[pl.product.name].setdefault("thumbnail_images",thumbnail_img.thumbnail_image)
			product_list[pl.product.name].setdefault("thumbnail_background_color",thumbnail_img.thumbnail_background_color)
		return JsonResponse(product_list, status=200)



'''

class ProductDetailView(View):
	def post(self, request):
		product_name_input = json.loads(request.body)
		product_images = ProductImage.objects.prefetch_related("color")
		colors=[]
		colors_image=[]
		for pi in product_images:
			if pi.product.name==product_name_input["product_name"]:
				product_name=pi.product.name
				product_description=pi.product.description
				if pi.color.name not in colors:
					colors.append(pi.color.name)
					colors_image.append(pi.color.color_image)
		product_image_list={}
		images=[]
		for cl in colors:
			for pi in product_images:
				if pi.product.name==product_name_input["product_name"]:
					if pi.color.name==cl:
						if pi.image not in images:
							images.append(pi.image)
			product_image_list[cl]=images
			images=[]
		product_videos = ProductVideo.objects.filter(product=Product.objects.get(name=product_name_input["product_name"]))
		product_videos_list = [pi.video for pi in product_videos]
		teaser = ProductTeaser.objects.select_related("product")
		p_teaser = []
		for t in teaser:
			if t.product.name==product_name_input["product_name"]:
				p_teaser.append(t)
		description = ProductDescription.objects.select_related("product")
		p_description = []
		for d in description:
			if d.product.name==product_name_input["product_name"]:
				p_description.append(d)
		specification=ProductSpecification.objects.select_related("product")
		p_specification = []
		for s in specification:
			if s.product.name==product_name_input["product_name"]:
				p_specification.append(s)
		if Product.objects.filter(name=product_name_input["product_name"]).exists():
			return JsonResponse({"product_name": product_name, "product_description": product_description, "color": colors, "color_image": colors_image, "product_images": product_image_list, "product_videos": product_videos_list,"Teaser": p_teaser[0].teaser, "Description": p_description[0].description, "specification": p_specification[0].specification}, status=200)
		else:
			return JsonResponse({"message": "Wrong Product Name"}, status=400)


class ProductDetailView(View):
	def post(self, request):
		product_name_input = json.loads(request.body)
		product_images = ProductImage.objects.filter(product=Product.objects.get(name=product_name_input["product_name"]), color=Color.objects.get(name=product_name_input["color"]))
		product_videos = ProductVideo.objects.filter(product=Product.objects.get(name=product_name_input["product_name"]))
		product_images_list=[pi.image for pi in product_images]
		product_videos_list=[pi.video for pi in product_videos]
		p_teaser = ProductTeaser.objects.get(product=Product.objects.get(name=product_name_input["product_name"]).id).teaser
		p_description = ProductDescription.objects.get(product=Product.objects.get(name=product_name_input["product_name"]).id).description
		p_specification = ProductSpecification.objects.get(product=Product.objects.get(name=product_name_input["product_name"]).id).specification
		if Product.objects.filter(name=product_name_input["product_name"]).exists():
			return JsonResponse({"product_name": product_images[0].product.name, "product_description": product_images[0].product.description, "color": product_images[0].color.name, "color_image": product_images[0].color.color_image, "product_images": product_images_list, "product_videos": product_videos_list,"Teaser": p_teaser, "Description": p_description, "specification": p_specification}, status=200)
		else:
			return JsonResponse({"message": "Wrong Product Name"}, status=400)

class ProductListView(View):
	def post(self, request): 
		product_name_input = json.loads(request.body)
		input_key_lists = product_name_input.keys()
		if 'subcategory' not in input_key_lists:
			subcategories=ProductSubCategory.objects.filter(category=ProductCategory.objects.get(name=product_name_input["category"]))
			product_lists=[]
			for subcategory in subcategories:
				for plist in Product.objects.filter(sub_category=subcategory):
					product_lists.append(plist)
			#print(product_lists)
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
			#return JsonResponse({"message": product_list}, status=200)
			return JsonResponse(product_list, status=200)

		elif 'subcategory' in input_key_lists:
			product_lists=Product.objects.filter(sub_category=ProductSubCategory.objects.get(name=product_name_input["subcategory"], category=ProductCategory.objects.get(name=product_name_input["category"])))
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
			#return JsonResponse({"message": product_list}, status=200)
			return JsonResponse(product_list, status=200)


class ProductFilterView(View):
	def post(self, request):
		product_name_input = json.loads(request.body)
		product_lists=[]
		product_sub_category=ProductSubCategory.objects.get(name=product_name_input["subcategory"])
		specified_filter_category=FilterCategory.objects.filter(sub_category=ProductSubCategory.objects.get(name=product_name_input["subcategory"]))
		#filters_list=FilterList.objects.filter(filter_name=product_name_input["filtername"])
		specified_filter_list=[]
		for sfc in specified_filter_category:
			specified_filters=FilterList.objects.filter(filter_name=product_name_input["filtername"], filter_category=sfc)
			for sf in specified_filters:
				if sf not in specified_filter_list:
					specified_filter_list.append(sf)
		product_names=[]
		for sfl in specified_filter_list:
			product_filters=ProductFilter.objects.filter(filter_list=sfl)
			for pf in product_filters:
				product_lists.append(pf)
		#print(product_lists)
		product_list={}
		for pl in product_lists:
			product_list.setdefault(pl.product.name, {"name":pl.product.name, "description":pl.product.description})
			colors=ProductImage.objects.filter(product=Product.objects.get(name=pl.product.name))
			colors_list=[c.color.name for c in colors]
			colors_new_list=[]
			color_images_list=[c.color.color_image for c in colors]
			color_images_new_list=[]
			thumbnail_img=ProductListThumbnail.objects.get(product=Product.objects.get(name=pl.product.name))
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
			product_list[pl.product.name].setdefault("color",colors_new_list)
			product_list[pl.product.name].setdefault("color_images",color_images_new_list)
			product_list[pl.product.name].setdefault("thumbnail_images",thumbnail_img.thumbnail_image)
			product_list[pl.product.name].setdefault("thumbnail_background_color",thumbnail_img.thumbnail_background_color)
		return JsonResponse(product_list, status=200)



class ProductDetailView(View):
	def post(self, request):
		product_name_input = json.loads(request.body)

		p_teaser = ProductTeaser.objects.get(product=Product.objects.get(name=product_name_input["product_name"]).id).teaser
		p_description = ProductDescription.objects.get(product=Product.objects.get(name=product_name_input["product_name"]).id).description
		p_specification = ProductSpecification.objects.get(product=Product.objects.get(name=product_name_input["product_name"]).id).specification
		if Product.objects.filter(name=product_name_input["product_name"]).exists():

			return JsonResponse({"Teaser": p_teaser, "Description": p_description, "specification": p_specification},
							status=200)
		else:
			return JsonResponse({"message": "Wrong Product Name"}, status=400)




class SigninView(View):
	def post(self,request):
		user_information_input=json.loads(request.body)
		try:
			encoded_userid=jwt.encode({'userid' : user_information_input["userid"]}, 'secret', algorithm='HS256')
			encoded_password=user_information_input["password"].encode('utf-8')
			if Account.objects.filter(userid=encoded_userid).exists():	
				userid_defined=Account.objects.get(userid=encoded_userid)
				if bcrypt.checkpw(encoded_password, userid_defined.password):
					return JsonResponse({'access_token': encoded_userid.decode('utf-8')},status=200)
				else:
					return JsonResponse({"message":"Wrong password"}, status=401)
			else:
				return JsonResponse({"message":"Please sign up first"}, status=404)
		except KeyError as e:
			return JsonResponse({"message":e}, status=400)				

# Create your views here.

class SignupView(View):
	def post(self, request):
		user_information_input=json.loads(request.body)
		if not Account.objects.filter(userid=user_information_input["userid"]).exists():
			Account(
				userid = user_information_input["userid"],
				password = user_information_input["password"],
				firstname = user_information_input["firstname"],
				lastname = user_information_input["lastname"],
				email = user_information_input["email"]
			).save()
		else:
			return JsonResponse({"message":"You already have signed up"}, status=409)
		return JsonResponse({"message":"Thanks for sign-up"}, status=200)

class SigninView(View):
	def post(self,request):
		user_information_input=json.loads(request.body)
		if Account.objects.filter(userid=user_information_input["userid"]).exists():	
			userid_defined=Account.objects.get(userid=user_information_input["userid"])
			if userid_defined.password == user_information_input["password"]:
				return JsonResponse({"message":"You are logged on"}, status=200)
			else:
				return JsonResponse({"message":"Wrong password"}, status=401)
		else:
			return JsonResponse({"message":"Please sign up first"}, status=400)
			
'''
