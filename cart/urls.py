from django.contrib import admin
from django.urls import (
	path,
	include
)

from cart.views import (
	OrderView,
	OrderListView
)

urlpatterns = [
	path('/order', OrderView.as_view()),
	path('/orderlist', OrderListView.as_view()),
]
