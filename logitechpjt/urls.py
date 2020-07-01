from django.urls import path, include
from account import urls
from product.views import TotalProductListForMain

urlpatterns = [
    #path('admin/', admin.site.urls),
    path('account/', include('account.urls')),
    path('product/', include('product.urls')),
    path('index/', include('product.urls')),
]
