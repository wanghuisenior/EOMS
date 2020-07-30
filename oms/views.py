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


def date2str(date):
	return date.strftime('%m-%d')


def get_home_data(request):
	orders = models.Order.objects.all()
	today = datetime.date.today()
	ret = {
		'sum': len(orders),
		'seven_day': {
			date2str(today - datetime.timedelta(6)): 0,
			date2str(today - datetime.timedelta(5)): 0,
			date2str(today - datetime.timedelta(4)): 0,
			date2str(today - datetime.timedelta(3)): 0,
			date2str(today - datetime.timedelta(2)): 0,
			date2str(today - datetime.timedelta(1)): 0,
			date2str(today): 0},
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
	for order in orders.filter(create_time__gte=today - datetime.timedelta(6)):
		weekday_index = order.create_time.isoweekday()
		order_create_date = order.create_time.date()
		if date2str(order_create_date) in ret['seven_day'].keys():
			ret['seven_day'][date2str(order_create_date)] += 1
	return HttpResponse(json.dumps(ret, cls=LazyEncoder))
