from django.shortcuts import render
import json
from .models import *
from product.models import *
from account.models import *
from django.views import View
from django.http import JsonResponse, HttpResponse
from account.utils import *


class OrderCreateView(View):
	@decorator_login
	def post(self, request):
		order_input = json.loads(request.body)
		received_email=request.user.email
		try:
			product_name=order_input["product_name"]
			product_color=order_input["color"]
			product_quantity=order_input["quantity"]
			OrderItem.objects.create(user=Account.objects.get(email=received_email), product_price=Product.objects.get(name=product_name).productprice_set.all()[0], product_quantity=product_quantity, product_color=Color.objects.get(name=product_color))
			return JsonResponse({'message':'Added to your cart'}, status=200)		

		except KeyError:
			product_name=order_input["product_name"]
			product_quantity=order_input["quantity"]
			OrderItem.objects.create(user=Account.objects.get(email=received_email), product_price=Product.objects.get(name=product_name).productprice_set.all()[0], product_quantity=product_quantity, product_color=Color.objects.get(name=""))
			return JsonResponse({'message':'Added to your cart'}, status=200)	

class OrderListView(View):
	@decorator_login
	def get(self, request):
		received_email=request.user.email
		order_list=OrderItem.objects.prefetch_related('product_price').filter(user_id=Account.objects.get(email=received_email))
		total_price=sum([ou.product_price.price for ou in order_list])

		product_list=[]
		product_id=[]
		for ou in order_list:
			if ou.product_price.product.name not in product_list:
				product_list.append(ou.product_price.product.name)
				product_id.append(ou.product_price.product.id)

		product_list_dict={}
		for pi in product_id:
			product_list_dict.setdefault(pi, {"name":Product.objects.get(id=pi).name})
			specified_product=OrderItem.objects.prefetch_related('product_price').filter(user_id=Account.objects.get(email=received_email),product_price=ProductPrice.objects.get(product=Product.objects.get(id=pi)))
			for s in specified_product:
				color_specified_product=OrderItem.objects.prefetch_related('product_price').filter(user_id=Account.objects.get(email=received_email),product_price=ProductPrice.objects.get(product=Product.objects.get(id=pi)),product_color=Color.objects.get(name=s.product_color.name))
				product_list_dict[pi].setdefault(s.product_color.id, {"thumbnail_image":ProductListThumbnail.objects.get(product=Product.objects.get(id=pi)).thumbnail_image,"color_image":s.product_color.color_image, "price":sum([c.product_price.price*c.product_quantity for c in color_specified_product]),"quantity":sum([c.product_quantity for c in color_specified_product])})
		
		return JsonResponse({'total_price':total_price, 'product_info':product_list_dict}, status=200)		