from django.contrib import admin

from django.urls import (
    path,
    include
)

from product.views import ProductDetailView

urlpatterns = [
	path('/productdetail/<slug:product_id>', ProductDetailView.as_view())
]
