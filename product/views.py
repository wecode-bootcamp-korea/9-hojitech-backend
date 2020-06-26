import json

from django.http import JsonResponse,HttpResponse
from django.shortcuts import render
from django.views import View
from .models import *
prefetch_mouse = ProductSubCategory.obejcts.prefetch_related('product_set')

class MouseListView(View):
    def post(self, request):
        data = json.loads(request.body)
        try:
            mice = Product.objects.filter(sub_category = data['product_sub_category'])
            if mice.size() ==0:
                return JsonResponse({"product: ": {"NO MACHING PRODUCTS"}})
            # return JsonResponse({"data"}: )
        except KeyError:
            pass    
        
