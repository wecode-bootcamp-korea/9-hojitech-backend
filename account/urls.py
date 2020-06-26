
from django.contrib import admin
from django.urls import path, include
from .views import SignUpView, SignInView

urlpatterns = [
	path('signup', SignUpView.as_view()),
	path('signin', SignInView.as_view())
]


