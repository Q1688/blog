# -*- coding:utf-8 –*-

from django.urls import path

from blogmessage import views


app_name = 'blogmessage'  # 定义一个命名空间，用来区分不同应用之间的链接地址
urlpatterns = [
    path('', views.index),
    path('category_list/<int:category_id>', views.category_list, name='category_list'),
    path('article_list/<int:article_id>', views.article_detail, name='article_list'),
    path('search', views.search),
]
