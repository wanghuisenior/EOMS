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
		'seven_day': {'周一': 0, '周二': 0, '周三': 0, '周四': 0, '周五': 0, '周六': 0, '周日': 0, '昨日': 0, '今日': 0},
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
		weekday_index = order.create_time.isoweekday()
		order_create_date = order.create_time.date()
		if order_create_date == yesterday:
			ret['seven_day']['昨日'] += 1
		elif order_create_date == today:
			ret['seven_day']['今日'] += 1
		elif weekday_index == 7:
			ret['seven_day']['周日'] += 1
		elif weekday_index == 6:
			ret['seven_day']['周六'] += 1
		elif weekday_index == 5:
			ret['seven_day']['周五'] += 1
		elif weekday_index == 4:
			ret['seven_day']['周四'] += 1
		elif weekday_index == 3:
			ret['seven_day']['周三'] += 1
		elif weekday_index == 2:
			ret['seven_day']['周二'] += 1
		elif weekday_index == 1:
			ret['seven_day']['周一'] += 1
	return HttpResponse(json.dumps(ret, cls=LazyEncoder))
