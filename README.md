## EOMS后台管理系统
Electronic operation management system电子工单管理系统  
后台基于django3实现  
后台管理系统模板：光年后台管理系统iframe模板  
安装依赖：pip install -r requirements.txt 
新建本地数据库：oms 并更改EOMS/config.py本地数据库连接账号密码  
运行命令生成表结构
python manage.py makemigrations  
python manage.py migrate  
运行oms.sql文件导入测试数据
运行项目：python manage.py runserver  
浏览器访问：http://127.0.0.1:8000