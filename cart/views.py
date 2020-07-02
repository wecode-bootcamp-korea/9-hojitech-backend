import json

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
from cart.models import (
	UserOrder,
	OrderItem
)
from account.utils import decorator_login


class OrderView(View):
	@decorator_login
	def post(self, request):
		order_input    = json.loads(request.body)
		received_email = request.user.email
		user_account   = Account.objects.get(email=received_email)

		product_id     = order_input["product_id"]
		product_color    = order_input["color"]
		product_quantity = order_input["quantity"]
		if UserOrder.objects.filter(user=user_account).exists():

			user_order_account = UserOrder.objects.get(user=user_account, order_status=OrderStatus.objects.get(id=1))

			OrderItem.objects.create(
				user_order       = user_order_account, 
				product_price    = Product.objects.get(id=product_id).productprice_set.get(), 
				product_quantity = product_quantity, 
				product_color    = Color.objects.get(name=product_color))
			
			order_list                     = user_account.userorder_set.get().orderitem_set.all()
			user_order_account.final_price = sum([order.product_price.price*order.product_quantity for order in order_list])
			user_order_account.save()

			return JsonResponse({'message':'Added to your cart'}, status=200)		

		else:
			UserOrder.objects.create(
				user         = user_account, 
				order_status = OrderStatus.objects.get(id=1),
				discount     = 0,
				final_price  = 0)
				
			user_order_account = UserOrder.objects.get(user=user_account)

			OrderItem.objects.create(
				user_order       = user_order_account, 
				product_price    = Product.objects.get(id=product_id).productprice_set.get(), 
				product_quantity = product_quantity, 
				product_color    = Color.objects.get(name=product_color))

			order_list                     = user_account.userorder_set.get().orderitem_set.all()
			user_order_account.final_price = sum([order.product_price.price*order.product_quantity for order in order_list])
			user_order_account.save()

			return JsonResponse({'message':'Added to your cart'}, status=200)		


class OrderListView(View):
	@decorator_login
	def get(self, request):
		received_email=request.user.email
		user_account   = Account.objects.get(email=received_email)
		order_list=OrderItem.objects.filter(user_order=UserOrder.objects.get(user=user_account, order_status=OrderStatus.objects.get(id=1)))
		total_price=sum([order.product_price.price*order.product_quantity for order in order_list])

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
					"color_name"     :s.product_color.name, 
					"color_image"    :s.product_color.color_image, 
					"price"          :s.product_price.price*s.product_quantity,
					"quantity"       :s.product_quantity})
				n+=1

		return JsonResponse({'total_price':total_price, 'product_info':product_list_dict}, status=200)		

