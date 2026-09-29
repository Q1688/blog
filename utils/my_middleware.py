# -*- coding:utf-8 –*-
from django.shortcuts import redirect
from django.urls import resolve
# 禁止别人直接登录Django的管理站点，设置只允许admin登录系统后进行站点操作，并且在/user_profile.html中添加{% if request.user.username == 'admin' %}进行判断
class LoginRequiredMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        return response

    def process_view(self, request, view_func, view_args, view_kwargs):
        url_name = resolve(request.path_info).url_name
        if url_name in ['index'] and not request.user.is_authenticated:
            return redirect('/user/login')  # 重定向到登录页面
        return None
