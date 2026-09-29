# -*- coding:utf-8 –*-

from django.urls import path

from user import views

app_name = 'user'  # 定义一个命名空间，用来区分不同应用之间的链接地址
urlpatterns = [
    path('login', views.user_login),
    path('register', views.register),
    path('active/<active_code>', views.active_user),
    path('forget_pwd', views.forget_pwd),
    path('reset_pwd_url/<active_code>', views.reset_pwd_url),
    path('user_profile', views.user_profile),
    path('user_exit',views.logo_out),
    path('edit_userinformation',views.edit_userInformation),
]
