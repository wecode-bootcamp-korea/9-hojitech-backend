import jwt

from django.http import (
    HttpResponse,
    JsonResponse
)

from logitechpjt.settings import SECRET_KEY
from account.models import Account

def decorator_login(func):
    def wrapper(self, request, *args, **kwargs):
        try:
            given_token  = request.headers.get("Authorization", None)
            payload      = jwt.decode(given_token, SECRET_KEY, algorithms='HS256')
            user         = Account.objects.get(id = payload['id'])
            request.user = user
        except jwt.exceptions.DecodeError:
            return JsonResponse({"Error Message": "INVALID_TOKEN"}, status = 400)
        except Account.DoesNotExist:
            return JsonResponse({"Error Message", "Id Dose Not Exist"}, status = 400)
        return func(self, request, *args, **kwargs)
    return wrapper
