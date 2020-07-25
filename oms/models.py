from django.db import models


# Create your models here.
class Order(models.Model):
	"""
	工单
	"""
	order_id = models.AutoField(primary_key=True)
	description = models.CharField(max_length=500)
	result = models.CharField(max_length=200)
	status = models.IntegerField(choices=[(0, '未处理'), (1, '已完成'), ], default=0)
	create_time = models.DateTimeField("创建时间", auto_now_add=True)
	update_time = models.DateTimeField("最后修改时间", auto_now=True)

	# 工单和客户--多对一 （一个客户可以对应多个工单）
	customer = models.ForeignKey('Customer', on_delete=models.CASCADE)
	# 工单和维修工--多对一  （一个维修工对应多个工单， 一个工单目前对应一个维修工）
	operator = models.ForeignKey('Operator', on_delete=models.CASCADE)
	objects = models.Manager()


class Customer(models.Model):
	"""
	客户
	"""
	customer_id = models.AutoField(primary_key=True)
	customer_name = models.CharField(max_length=200)
	objects = models.Manager()


class Operator(models.Model):
	"""
	维修工
	"""
	operator_id = models.AutoField(primary_key=True)
	operator_name = models.CharField(max_length=200)
	objects = models.Manager()


class Article(models.Model):
	"""
	文章
	"""
	article_id = models.AutoField(primary_key=True)
	title = models.CharField(max_length=200)
	objects = models.Manager()
