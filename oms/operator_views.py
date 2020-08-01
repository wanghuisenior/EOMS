#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
 @FileName: operator_views.py
 @Author: 王辉/Administrator
 @Email: wanghui@zih718.com
 @Date: 2020/7/29 14:43
 @Description:
"""

import json

from django.http import HttpResponse
from django.shortcuts import render

from oms import models
from oms.utils.LazyEncoder import LazyEncoder


def operator_view(request):
	return render(request, 'operator_list.html')


def operator_list(request):
	data = []
	operators = models.Operator.objects.all()
	for o in operators:
		data.append({
			'operator_id': o.operator_id,
			'operator_name': o.operator_name,
		})
	print(data)
	return HttpResponse(json.dumps(data, cls=LazyEncoder))


def operator_add(request):
	operator_name = request.POST.get('operator_name')
	dic = {
		"operator_name": operator_name}
	try:
		models.Operator.objects.create(**dic)
	except Exception as e:
		print(e)
	return HttpResponse(json.dumps(200))


def operator_del(request):
	operator_id = request.GET.get('operator_id')
	try:
		models.Operator.objects.get(operator_id=operator_id).delete()
		return HttpResponse(json.dumps(200))
	except Exception as e:
		return HttpResponse(json.dumps(500))
