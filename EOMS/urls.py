"""EMOS URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# from django.contrib import admin
from django.urls import path

from oms import order_views, views

urlpatterns = [
	#    path('admin/', admin.site.urls),
	path('', views.index),
	path('index', views.index),
	path('home', views.home),
	path('get_home_data', views.get_home_data),
	# order
	path('orders_view', order_views.orders_view),
	path('get_orders', order_views.get_orders),
	path('order_add', order_views.order_add),
	path('update_status', order_views.update_status),
]
