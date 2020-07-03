from django.contrib import admin

from django.urls import (
    path,
    include
)

from product.views import (
    ProductDetailView,
    MouseFilterListView,
    KeyboardFilterListView,
    MouseListView,
    KeyboardListView,
    TotalProductListForMain
)

urlpatterns = [
	path('mice', MouseListView.as_view()),
    path('keyboards', KeyboardListView.as_view()),
    path('mice/filter', MouseFilterListView.as_view()),
    path('', TotalProductListForMain.as_view()),
    path('keyboards/filter', KeyboardFilterListView.as_view()),
	path('/productdetail/<slug:product_id>', ProductDetailView.as_view())
]
