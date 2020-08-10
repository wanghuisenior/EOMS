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


def question_view(request):
	return render(request, 'question_list.html')


def question_list(request):
	data = []
	questions = models.Question.objects.all()
	for q in questions:
		data.append({
			'question_id': q.question_id,
			'question_type': q.question_type,
			# 'question_name': q.question_name,
		})
	return HttpResponse(json.dumps(data, cls=LazyEncoder))


def question_add(request):
	question_type = request.POST.get('question_type')
	# question_name = request.POST.get('question_name')
	dic = {
		"question_type": question_type,
		# "question_name": question_name
	}
	try:
		models.Question.objects.create(**dic)
	except Exception as e:
		print(e)
	return HttpResponse(json.dumps(200))


def question_del(request):
	question_id = request.GET.get('question_id')
	try:
		models.Question.objects.get(question_id=question_id).delete()
		return HttpResponse(json.dumps(200))
	except Exception as e:
		return HttpResponse(json.dumps(500))
