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
from django.conf import settings
from django.conf.urls import url, static
from django.urls import path

from oms import views, order_views, question_views, customer_views, operator_views, user_views, article_views

urlpatterns = [
	#    path('admin/', admin.site.urls),
	path('', views.index),
	path('index', views.index),
	path('home', views.home),
	path('get_home_data', views.get_home_data),

	# order
	path('order_view', order_views.order_view),
	path('order_list', order_views.order_list),
	path('order_add', order_views.order_add),
	path('order_del', order_views.order_del),
	path('update_status', order_views.update_status),
	path('getTypeaheadData', order_views.getTypeaheadData),

	# 故障管理
	path('question_view', question_views.question_view),
	path('question_list', question_views.question_list),
	path('question_add', question_views.question_add),
	path('question_del', question_views.question_del),

	# 客户管理
	path('customer_view', customer_views.customer_view),
	path('customer_list', customer_views.customer_list),
	path('customer_add', customer_views.customer_add),
	path('customer_del', customer_views.customer_del),

	# 维修工管理
	path('operator_view', operator_views.operator_view),
	path('operator_list', operator_views.operator_list),
	path('operator_add', operator_views.operator_add),
	path('operator_del', operator_views.operator_del),
	# 文章管理
	# path('article_view', article_views.article_view),
	# 个人信息
	path('profile', user_views.profile),
	path('edit_pwd', user_views.edit_pwd),
	#
	# 增加以下一行，解决关闭debug模式后无法识别静态资源
	url(r'^static/(?P<path>.*)$', static.serve, {'document_root': settings.STATIC_ROOT}, name='static')
]
# 4040处理
handler404 = "oms.views.page_not_found"
