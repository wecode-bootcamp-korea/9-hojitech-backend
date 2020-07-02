from django.contrib import admin
from django.urls import (
    path,
    include
)

from account import urls
from product import urls
from cart import urls

urlpatterns = [
	path('account', include('account.urls')),
    path('product', include('product.urls')),
    path('cart', include('cart.urls')),
]
