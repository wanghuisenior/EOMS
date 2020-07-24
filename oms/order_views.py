#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
 @FileName: order_views.py
 @Author: 王辉/Administrator
 @Email: wanghui@zih718.com
 @Date: 2020/7/22 16:50
 @Description: 工单有关的视图
"""
import json

from django.http import HttpResponse
from django.shortcuts import render


def orders_view(request):
	return render(request, 'order_list.html')


def get_orders(request):
	data = {
		"total": 800,
		"totalNotFiltered": 800,
		"rows": [
			{
				"id": 0,
				"name": "Item 0",
				"price": "$0"
			},
			{
				"id": 1,
				"name": "Item 1",
				"price": "$1"
			},
			{
				"id": 2,
				"name": "Item 2",
				"price": "$2"
			},
			{
				"id": 3,
				"name": "Item 3",
				"price": "$3"
			},
			{
				"id": 4,
				"name": "Item 4",
				"price": "$4"
			},
			{
				"id": 5,
				"name": "Item 5",
				"price": "$5"
			},
			{
				"id": 6,
				"name": "Item 6",
				"price": "$6"
			},
			{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},{
				"id": 7,
				"name": "Item 7",
				"price": "$7"
			},
			{
				"id": 8,
				"name": "Item 8",
				"price": "$8"
			},
			{
				"id": 9,
				"name": "Item 9",
				"price": "$9"
			}
		]
	}
	return HttpResponse(json.dumps(data))
