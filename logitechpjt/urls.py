from django.urls import (
    path,
    include
)
from account import urls

urlpatterns = [
    path('account', include('account.urls')),
    path('product', include('product.urls')),
    path('index', include('product.urls')),
    path('cart', include('cart.urls')),
]
