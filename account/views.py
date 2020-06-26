import json
import bcrypt
import jwt
import re

from logitechpjt.settings import SECRET_KEY
from django.shortcuts import render
from django.shortcuts import render
from django.views import View

from account.models import Account

from django.views.decorators.csrf import csrf_exempt
from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse, HttpResponse

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
            
            if Account.objects.filter(email = data['email']).exists():      # email 존재 여부 확인
                
                print("email is already exists")
                return JsonResponse({"messege": "Email Already exists"}, status = 400)

            else:       # email 등록 가능, 정규식 확인 시작
                
                if email_validation.match(data['email']):  # 이메일 정규식 성공
                    print("email validation" ,email_validation.match(data['email']))
                    if password_validation.match(data['password']):    # 비밀번호 정규식 성공
                        # 비밀번호 암호화
                        password = data['password'].encode('utf-8')
                        password_bcrypt = bcrypt.hashpw(password, bcrypt.gensalt())
                        password = password_bcrypt.decode('utf-8')
                    
                        Account.objects.create(email=data['email'], password=password, first_name=data['first_name'], last_name=data['last_name'])
                        return JsonResponse( { "message" : "SignUp Success!" }, status = 200 )
                    else:
                        return JsonResponse( { "message" : "Password Validation Failed" }, status = 400 )
                else:   # 이메일 정규식 실패
                    return JsonResponse( { "message" : "Email Validation Failed!" }, status = 400 )
                    
        except KeyError:
            return JsonResponse({"message": "Insert Invalid Keys"}, status = 400)

# login decorator
def decorator_login(func):
    def wrapper(self, request, *args, **kwargs):
        try:
            given_token = request.headers.get("Authorization", None)
            payload = jwt.decode(given_token, SECRET_KEY, algorithms='HS256')
            user = Account.objects.get(id = payload['id'])
            request.user = user
            print("login succeed")
        
        except jwt.exceptions.DecodeError:
            return JsonResponse({"Error Message": "Invalid_token"}, status = 400)
        except ObjectDoesNotExist:
            return JsonResponse({"Error Message", "Id Dose Not Exist"}, status = 400)

        return func(self, request, *args, **kwargs)

    return wrapper

class SignInView(View):
    def post(self, request):
        data = json.loads(request.body)

        # 회원 여부 확인
        if Account.objects.filter(email = data['email']).exists():
            account         =       Account.objects.get(email = data['email'])
            print(account)

            # password 확인
            if bcrypt.checkpw(data['password'].encode('utf-8'), account.password.encode('utf-8')):
                
                # 비밀번호 일치
                token = jwt.encode({'id': account.id}, SECRET_KEY, algorithm ="HS256")
                token = token.decode('utf-8')
                print(token)
                return JsonResponse({"message":"Login Succeeded", "token" : token })
            else:
                return JsonResponse({"message": "Invalid Password"})
        else:
            return JsonResponse({"messege" : "Not Existing Account"})