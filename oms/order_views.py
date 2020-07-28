#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
 @FileName: order_views.py
 @Author: 王辉/Administrator
 @Email: wanghui@zih718.com
 @Date: 2020/7/22 16:50
 @Description: 工单有关的视图
"""
import datetime
import json

from django.http import HttpResponse
from django.shortcuts import render

from oms import models
from oms.utils.LazyEncoder import LazyEncoder


def orders_view(request):
	return render(request, 'order_list.html')


def get_orders(request):
	data = []
	search = request.GET.get('search')
	status = request.GET.get('status')
	date_start_str = request.GET.get('date_start')
	date_end_str = request.GET.get('date_end')
	query_dict = {}
	if date_start_str and date_end_str:
		date_s = datetime.datetime.strptime(date_start_str, '%Y-%m-%d')
		date_e = datetime.datetime.strptime(date_end_str, '%Y-%m-%d') + datetime.timedelta(hours=23, minutes=59,
																						   seconds=59)
		query_dict['create_time__range'] = [date_s, date_e]
	if status:
		query_dict['status'] = status
	orders = models.Order.objects.filter(**query_dict)
	for o in orders:
		data.append({
			'order_id': o.order_id,
			'description': o.description,
			'customer_name': o.customer.customer_name,
			'operator_name': o.operator.operator_name,
			'create_time': o.create_time,
			'update_time': o.update_time,
			# 'status': o.get_status_display(),
			'status': o.status,
		})
	return HttpResponse(json.dumps(data, cls=LazyEncoder))


def order_add(request):
	description = request.POST.get('description', '')
	customer_id = request.POST.get('customer_id', None)
	operator_id = request.POST.get('operator_id', None)
	result = request.POST.get('result', '')
	dic = {
		"description": description,
		"customer_id": int(customer_id),  # 直接指定  外键值了，这里要加 _id
		"operator_id": int(operator_id),
		"result": result}
	try:
		models.Order.objects.create(**dic)
	except Exception as e:
		print(e)
	return HttpResponse(json.dumps(200))


def update_status(request):
	order_id = request.POST.get('order_id')
	status = request.POST.get('status')
	try:
		order = models.Order.objects.get(order_id=order_id)
		order.status = status
		order.save()
		return HttpResponse(json.dumps(200))
	except Exception as e:
		return HttpResponse(json.dumps(500))
