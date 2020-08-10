#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
 @desc: 通过判断本机ip是否等于服务器ip实现自动切换开发和生产环境
"""
import socket

server_ip = '10.10.9.79'  # 远程服务器内网IP


def get_host_ip():
	"""
	获取本地IP地址
	:return:
	"""
	try:
		s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
		s.connect(('8.8.8.8', 80))
		ip = s.getsockname()[0]
	finally:
		s.close()
	return ip


class Local:  # 本地环境配置
	DEBUG = True
	DATABASES = {
		'default': {
			###########################################
			'ENGINE': 'django.db.backends.mysql',
			'NAME': 'oms',  # 数据库名字
			'USER': 'root',
			'PASSWORD': 'root',
			'HOST': '127.0.0.1',
			'PORT': '3306',
			###########################################
		},
	}


class Remote:  # 正式环境配置
	DEBUG = False
	DATABASES = {
		'default': {
			'ENGINE': 'django.db.backends.mysql',
			'NAME': 'Zihdata',  # 正式数据库名字
			'HOST': '10.10.9.76',
			'PORT': '3306',
			'USER': 'root',
			'PASSWORD': 'Ffaj7tVKa?pbanliedashuju',
		},
	}


class DBConfig:
	__conf = None
	# 判断本地获取到的ip地址与服务器内网ip是否相同，相同则为正式环境，不同则为开发环境
	__is_remote = get_host_ip() == server_ip

	def get_config(self):
		if self.__conf is None:
			if self.__is_remote:
				self.__conf = Remote()
			else:
				self.__conf = Local()
		return self.__conf
