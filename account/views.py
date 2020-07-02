import json
import bcrypt
import jwt
import re

from django.views.decorators.csrf import csrf_exempt
from django.core.exceptions import ObjectDoesNotExist
from django.http import (
    JsonResponse,
    HttpResponse
)
from django.views import View

from logitechpjt.settings import SECRET_KEY
from account.models import (
    Account, 
    UserProduct
)
from account.models import (
    UserProduct,
    Product
)
from account.utils import decorator_login



'''
Email validation
1. 사용자 이름은 6~30자 길이를 가질 수 있으며 영문자, 숫자, 기호를 입력 가능하다
2. 사용자 이름에 &, =, _ , ' , + , ',', <, > 또는 연속으로 ..을 할 수 없다
3. 마침표로 시작하거나 끝나면 안된다 

Password validation
1. 비밀번호는 8자 이상
2. 공백으로 시작하거나 끝날 수 없다
3. 적어도 1개의 특수문자를 포함해야 한다.
4. 문자 숫자 특수문자 조합이여야 한다.
'''

class SignUpView(View):
    def post(self, request):
        data = json.loads(request.body)
        email_validation        =       re.compile("^\S[a-zA-Z0-9+-_.]{4,28}\S@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
        password_validation     =       re.compile("^(?=.{10,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$")
        try:
            if Account.objects.filter(email = data['email']).exists():
                return JsonResponse({"messege": "Email Already exists"}, status = 400)            

            if email_validation.match(data['email']):
                if password_validation.match(data['password']):
                    password = bcrypt.hashpw(data['password'].encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
                    Account.objects.create(
                            email=data['email'], 
                            password=password, 
                            first_name=data['first_name'], 
                            last_name=data['last_name']
                        )
                    return HttpResponse( status = 200 )

                return JsonResponse( { "message" : "INVALID_PASSWORD" }, status = 400 )

            return JsonResponse( { "message" : "INVALID_EMAIL" }, status = 400 )            

        except KeyError:
            return JsonResponse({"message": "INVALID_KEYS"}, status = 400)

class SignInView(View):
    def post(self, request):
        data = json.loads(request.body)
        try:
            if Account.objects.filter(email = data['email']).exists():
                account = Account.objects.get(email = data['email'])

                if bcrypt.checkpw(data['password'].encode('utf-8'), account.password.encode('utf-8')):
                    token = jwt.encode({'id': account.id}, SECRET_KEY, algorithm = "HS256")
                    return JsonResponse({"token" : token.decode('utf-8') }, status = 200)

                return HttpResponse(status = 401)

            return HttpResponse(status = 401)
            
        except KeyError:
            return JsonResponse({"message": "INVALID_KEYS"}, status = 400)

class ProductRegisterView(View):
    @decorator_login
    def get(self, request):
        user = request.user
        product_all = Product.objects.select_related("sub_category").filter(
            Q(sub_category__id=1) | Q(sub_category__id=3))
        subcate_id = [
            {"cate_id": product.sub_category.id, "cate_name": product.sub_category.name, "models": product.name} for
            product in product_all]
        print(subcate_id)
        return JsonResponse({"data": subcate_id})

    @decorator_login
    def post(self, request):
        data = json.loads(request.body)
        user = request.user

        UserProduct(
            user               = Account.objects.get(email=user.email),
            registered_product = Product.objects.get(name=data['model_name'])
        ).save()

        return JsonResponse({"message":"Successfully saved"}, status=200)