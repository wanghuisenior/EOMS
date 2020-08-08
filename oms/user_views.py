#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
 @FileName: user_views.py
 @Author: 王辉/Administrator
 @Email: wanghui@zih718.com
 @Date: 2020/7/24 17:35
 @Description:
"""
from django.shortcuts import render


def profile(request):
	return render(request, 'profile.html')


def edit_pwd(request):
	return render(request, 'edit_pwd.html')
