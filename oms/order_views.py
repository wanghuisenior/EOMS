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


def order_view(request):
	return render(request, 'order_list.html')


def order_list(request):
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
	customer_name = request.POST.get('customer_name', None)
	question_type = request.POST.get('question_type', None)
	description = request.POST.get('description', '')
	operator_name = request.POST.get('operator_name', None)
	# print('customer_name', customer_name, 'question_type', question_type, 'description', description, 'operator_name',
	# 	  operator_name)
	cus, cus_created = models.Customer.objects.get_or_create(customer_name=customer_name)
	op, op_created = models.Operator.objects.get_or_create(operator_name=operator_name)
	q, q_created = models.Question.objects.get_or_create(question_type=question_type)
	try:
		dic = {
			"description": description,
			"customer_id": cus.customer_id,  # 直接指定  外键值了，这里要加 _id
			"operator_id": op.operator_id,
			# "question": int(question_type),#多对多关系不能create，必须用add
		}
		order = models.Order.objects.create(**dic)
		order.question.add(q)
		order.save()
		return HttpResponse(json.dumps(200))
	except Exception as e:
		print(e)
		return HttpResponse(json.dumps(500))


def order_del(request):
	order_id = request.GET.get('order_id')
	try:
		models.Order.objects.get(order_id=order_id).delete()
		return HttpResponse(json.dumps(200))
	except Exception as e:
		return HttpResponse(json.dumps(500))


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


def getTypeaheadData(request):
	keyword = request.GET.get('keyword')
	type = request.GET.get('type')
	ret = []
	if type == 'customer':
		queryset = models.Customer.objects.filter(customer_name__contains=keyword)
		for q in queryset:
			ret.append({'customer_id': q.customer_id, 'customer_name': q.customer_name})
	elif type == 'question':
		queryset = models.Question.objects.filter(question_type__contains=keyword)
		for q in queryset:
			ret.append({'question_id': q.question_id, 'question_type': q.question_type})
	elif type == 'operator':
		queryset = models.Operator.objects.filter(operator_name__contains=keyword)
		for q in queryset:
			ret.append({'operator_id': q.operator_id, 'operator_name': q.operator_name})
	return HttpResponse(json.dumps(ret))
