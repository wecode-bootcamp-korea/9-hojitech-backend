from django.shortcuts import render
import json
from .models import *
from django.views import View
from django.http  import JsonResponse, HttpResponse

class ProductDetailView(View):
	def post(self, request):
		product_name_input=json.loads(request.body)
		if Product.objects.filter(name=product_name_input[product_name]).exists():
			return JsonResponse({"Teaser":ProductTeaser.objects(product=Product.objects.filter(name=product_name_input[product_name])[0].teaser)}, status=200)
		else:
			return JsonResponse({"message":"Wrong Product Name"}, status=400)


'''
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