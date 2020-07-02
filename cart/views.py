import json

from django.shortcuts import render
from django.views import View
from django.http import (
	JsonResponse,
	HttpResponse
)

from .models import (
	OrderItem,
	OrderStatus
)
from product.models import (
	Product,
	Color
)
from account.models import Account
from account.utils import decorator_login


class OrderView(View):
	@decorator_login
	def post(self, request):
		order_input = json.loads(request.body)
		received_email=request.user.email
		try:
			product_name     = order_input["product_name"]
			product_color    = order_input["color"]
			product_quantity = order_input["quantity"]
			OrderItem.objects.create(
				user             = Account.objects.get(email=received_email), 
				product_price    = Product.objects.get(name=product_name).productprice_set.get(), 
				product_quantity = product_quantity, 
				product_color    = Color.objects.get(name=product_color),
				order_status     = OrderStatus.objects.get(id=1))
			return JsonResponse({'message':'Added to your cart'}, status=200)		

		except KeyError:
			product_name     = order_input["product_name"]
			product_quantity = order_input["quantity"]
			OrderItem.objects.create(user=Account.objects.get(email=received_email), 
				product_price    = Product.objects.get(name=product_name).productprice_set.get(), 
				product_quantity = product_quantity, 
				product_color    = Color.objects.get(name=""),
				order_status     = OrderStatus.objects.get(id=1))
			return JsonResponse({'message':'Added to your cart'}, status=200)	

class OrderListView(View):
	@decorator_login
	def get(self, request):
		received_email=request.user.email
		order_list=OrderItem.objects.prefetch_related('product_price').filter(user_id=Account.objects.get(email=received_email))
		total_price=sum([ou.product_price.price*ou.product_quantity for ou in order_list])

		product_id=[]
		for order in order_list:
			if order.product_price.product.id not in product_id:
				product_id.append(order.product_price.product.id)

		product_list_dict=[]
		n=1
		for pi in product_id:
			specified_product      = Product.objects.get(id=pi)
			specified_product_list = order_list.filter(product_price=specified_product.productprice_set.get())
			for s in specified_product_list:	
				product_list_dict.append({
					"id"             :n,
					"name"           :specified_product.name,
					"thumbnail_image":specified_product.product_thumbnail.get().thumbnail_image,
					"color_image"    :s.product_color.color_image, 
					"price"          :s.product_price.price*s.product_quantity,
					"quantity"       :s.product_quantity})
				n+=1

		return JsonResponse({'total_price':total_price, 'product_info':product_list_dict}, status=200)		

