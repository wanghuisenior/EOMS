import datetime
import json

from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from oms import models
from oms.utils.LazyEncoder import LazyEncoder


def index(request):
	return render(request, 'index.html')


def home(request):
	return render(request, 'home.html')


def get_home_data(request):
	orders = models.Order.objects.all()
	today = datetime.date.today()
	ret = {
		'sum': len(orders),
		'seven_day': {},
		'today': len(
			orders.filter(create_time__year=today.year, create_time__month=today.month, create_time__day=today.day)),
		'untreated': []}
	for o in orders.filter(status=0):
		ret['untreated'].append(
			{'order_id': o.order_id,
			 'description': o.description,
			 'customer_name': o.customer.customer_name,
			 'operator_name': o.operator.operator_name,
			 'create_time': o.create_time,
			 'status': o.get_status_display(), })
	# 最近7天数据
	yesterday = today - datetime.timedelta(1)
	for order in orders.filter(create_time__gte=today - datetime.timedelta(6)):
		wd = order.create_time.isoweekday()
		d = '昨日' if order.create_time.date() == yesterday \
			else '今日' if order.create_time.date() == today \
			else '周日' if wd == 7 \
			else '周六' if wd == 6 \
			else '周五' if wd == 5 \
			else '周四' if wd == 4 \
			else '周三' if wd == 3 \
			else '周二' if wd == 2 \
			else '周一' if wd == 1 \
			else '未知'
		if d in ret['seven_day'].keys():
			ret['seven_day'][d] += 1
		else:
			ret['seven_day'][d] = 1
	print(ret['seven_day'])
	return HttpResponse(json.dumps(ret, cls=LazyEncoder))
