
from django.contrib import admin
from django.urls import path, include
from .views import *

urlpatterns = [
	path('sign-up', SignUpView.as_view()),
	path('sign-in', SignInView.as_view()),
	path('register', ProductRegisterView.as_view())
]