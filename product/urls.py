from django.contrib import admin
from django.urls import path, include
from product.views import *

urlpatterns = [
	path('productdetail', ProductDetailView.as_view()),
	path('mice', MouseListView.as_view()),
    path('keyboards', KeyboardListView.as_view()),
    path('mice/filter', MouseFilterListView.as_view()),
    path('', TotalProductListForMain.as_view()),
    path('keyboards/filter', KeyboardFilterListView.as_view()),
]
