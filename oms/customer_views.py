#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
 @FileName: question_views.py
 @Author: 王辉/Administrator
 @Email: wanghui@zih718.com
 @Date: 2020/7/29 11:09
 @Description:
"""
import json

from django.http import HttpResponse
from django.shortcuts import render

from oms import models
from oms.utils.LazyEncoder import LazyEncoder


def customer_view(request):
	return render(request, 'customer_list.html')


def customer_list(request):
	data = []
	questions = models.Customer.objects.all()
	for q in questions:
		data.append({
			'customer_id': q.customer_id,
			'customer_name': q.customer_name,
		})
	return HttpResponse(json.dumps(data, cls=LazyEncoder))


def customer_add(request):
	customer_name = request.POST.get('customer_name')
	dic = {
		"customer_name": customer_name}
	try:
		models.Customer.objects.create(**dic)
	except Exception as e:
		print(e)
	return HttpResponse(json.dumps(200))


def customer_del(request):
	customer_id = request.GET.get('customer_id')
	try:
		models.Customer.objects.get(customer_id=customer_id).delete()
		return HttpResponse(json.dumps(200))
	except Exception as e:
		return HttpResponse(json.dumps(500))
