import os
import django
import csv
import sys
from product.models import *
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "db_logitech.settings")
django.setup()



def insert_products():

	
	with open('logitech_product_category.csv') as csv_master:
		n=1
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
			if row[0]:
				MainMenu.objects.create(id=n,name=row[0])
				n+=1
			
		
	with open('logitech_product_category.csv') as csv_master:
		n=1
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
			if row[3]:
				ProductCategory.objects.create(id=n,menu=MainMenu.objects.get(name=row[2]), name=row[3])
				n+=1

		
	with open('logitech_product_category.csv') as csv_master:
		n=1
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
			if row[7]:
				ProductSubCategory.objects.create(id=n,category=ProductCategory.objects.get(name=row[6]), name=row[7])
				n+=1				
			
	with open('logitech_product_category.csv') as csv_master:
		n=1
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
			if row[10]:
				Product.objects.create(id=n,sub_category=ProductSubCategory.objects.get(name=row[9]), name=row[10], description=row[11])
				n+=1				
		
	with open('logitech_product_thumbnail.csv') as csv_master:
		n=1
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
			if row[3]:
				Color.objects.create(id=n, name=row[3], color_image=row[4])
				n+=1
	
	with open('logitech_product_thumbnail.csv') as csv_master:
		
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
			if row[5]:
				Color.objects.create(id=n, name=row[5], color_image=row[6])
				n+=1	
			
	with open('logitech_product_thumbnail.csv') as csv_master:
		
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
			if row[7]:
				Color.objects.create(id=n, name=row[7], color_image=row[8])
				n+=1



'''
# Drink

	with open('./drink/starbucks_master_sheet.csv') as csv_master:
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
				Drink.objects.create(drink_name_kor=row[0], drink_name_eng=row[1])

# Drink_type

	with open('./drink/starbucks_master_sheet.csv') as csv_master:
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
				Drink_type.objects.create(drink_name=Drink.objects.get(drink_name_kor=row[0]), drink_type=row[2])

#Nutrition_info

	with open('./drink/starbucks_master_sheet.csv') as csv_master:
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
				Nutrition_info.objects.create(one_serving_kcal=row[5], sodium_mg=row[6], saturated_fat_g=row[7], sugars_g=row[8], protein_g=row[9], caffeine_mg=row[10])

#Drink_info

	with open('./drink/starbucks_master_sheet.csv') as csv_master:
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		n=1
		for row in csv_read:
				Drink_info.objects.create(drink_name=row[0], nutrition=Nutrition_info.objects.get(id=n), drink=Drink_type.objects.get(drink_name=Drink.objects.get(drink_name_kor=row[0])))
				n=n+1

#Allergy

	with open('./drink/allergy.csv') as csv_master:
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
				Allergy.objects.create(allergy=row[0])

#Allergy_Drink 시작

	with open('./drink/starbucks_master_sheet.csv') as csv_master:
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
				if row[11]:
						Allergy_Drink.objects.create(drink=Drink_info.objects.get(drink_name=row[0]), allergy=Allergy.objects.get(allergy=row[11]))


	with open('./drink/starbucks_master_sheet.csv') as csv_master:
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
				if row[12]:
						Allergy_Drink.objects.create(drink=Drink_info.objects.get(drink_name=row[0]), allergy=Allergy.objects.get(allergy=row[12]))


	with open('./drink/starbucks_master_sheet.csv') as csv_master:
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
				if row[13]:
						Allergy_Drink.objects.create(drink=Drink_info.objects.get(drink_name=row[0]), allergy=Allergy.objects.get(allergy=row[13]))


	with open('./drink/starbucks_master_sheet.csv') as csv_master:
		csv_read=csv.reader(csv_master)
		next(csv_read, None)
		for row in csv_read:
				if row[14]:
						Allergy_Drink.objects.create(drink=Drink_info.objects.get(drink_name=row[0]), allergy=Allergy.objects.get(allergy=row[14]))

#Allergy_Drink 끝


import os
import django
import csv
import sys

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "starbucks_sqlite.settings")
django.setup()

from product.models import Menu, Category, Drink

CSV_PATH_PRODUCTS = './products.csv'

def insert_products:
	with open(CSV_PATH_PRODUCTS) as in_file:
		data_reader = csv.reader(in_file)
		next(data_reader, None)
		for row in data_reader:
			if row[0]:
				menu_name=row[0]
				Menu.objects.create(name = menu_name)

			category_name = row[1]
			menu_id = Menu.objects.get(name = menu_name).id

			Category.objects.create(name = category_name, menu_id = menu_id)

			category_id = Category.objects.get(name = category_name).id

			drinks = row[2].split(',')

			for drink in drinks:
				if drink: #drink가 빈칸 아니고 실제로 존재한다면
				Drink.objects.create(name = drink, menu_id = menu_id, category_id = category_id)
'''

