from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import User
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render, redirect

from user.form import Loginform, Registerform, ForgetPwdForm, ModifyPwdForm, UserForm, UserProfileForm
from user.models import EmailVerifyRecord, userProfile
from utils.email_send import send_register_email


def user_login(request):
    if request.method != 'POST':
        form = Loginform()
    else:
        form = Loginform(request.POST)
        # 检查提交的数据是否满足字段定义的约束（如 required=True、max_length、min_value 等）
        if form.is_valid():
            # 若验证通过，将原始数据转换为 Python 原生类型（如字符串转日期、整数等），并存储在 cleaned_data 字典中
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            # authenticate进行用户名和密码认证，authenticate认证失败只会返回None
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                # 登录成功跳到个人中心
                return redirect('/')
            else:
                # 验证不通过提示
                return HttpResponse("""
                    <script type="text/javascript">
                    if (confirm("验证不通过提示,请重新检查输入的用户名及密码！")) {
                        window.location.href = "%s";
                    }
                    </script>
                    """ % redirect('/user/login').url)

    context = {'form': form}
    return render(request, 'user/login.html', context)


class MyBackend(ModelBackend):
    '''邮箱登录'''

    # 重写方法
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = User.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):  # 加密明文密码
                return user
        except Exception as e:
            return None


# 注册功能
def register(request):
    if request.method != 'POST':
        # 不是post请求显示空表单
        form = Registerform()
    else:
        # 获取表单中的数据
        form = Registerform(request.POST)
        if form.is_valid():
            # commit=False将表单中的变成对象暂存起来
            new_user = form.save(commit=False)
            # 获取表中的密码进行HASH加密
            new_user.set_password(form.cleaned_data.get('password'))
            new_user.username = form.cleaned_data.get('email')
            new_user.save()
            # # 邮箱注册发送邮件,发送成功返回状态码1
            send_status = send_register_email(form.cleaned_data.get('email'), 'register')
            # new_user.save()
            if send_status == 1:
                new_user.save()
                return HttpResponse("""
                <script type="text/javascript">
                if (confirm("注册成功，邮件已发送请查收！")) {
                    window.location.href = "%s";
                }
                </script>
                """ % redirect('/user/login').url)
            else:
                return HttpResponse("""
                                <script type="text/javascript">
                                if (confirm("注册失败，邮件发送失败请重新注册！")) {
                                    window.location.href = "%s";
                                }
                                </script>
                                """ % redirect('/user/register').url)
    context = {'form': form}
    return render(request, 'user/register.html', context)


def active_user(request, active_code):
    '''修改用户状态，比对链接验证码'''
    all_records = EmailVerifyRecord.objects.filter(code=active_code)
    if all_records:
        for recod in all_records:
            email = recod.email
            user = User.objects.get(email=email)
            user.is_staff = True
            user.save()
    else:
        return HttpResponse("链接有误!")
    # 点击邮箱链接跳转到登录页面进行登录验证
    return redirect('/user/login')


# 忘记密码进行邮件发送重置
def forget_pwd(request):
    if request.method == 'GET':
        form = ForgetPwdForm()
    elif request.method == 'POST':
        form = ForgetPwdForm(request.POST)  # 获取表单数据
        if form.is_valid():
            # 获取邮箱与数据库中数据进行对比
            email = form.cleaned_data['email']
            exits = User.objects.filter(email=email).exists()
            if exits:
                # 查询到邮箱已经注册则进行邮件发送
                send_status = send_register_email(email, 'forget')
                if send_status == 1:
                    return HttpResponse("""
                <script type="text/javascript">
                if (confirm("邮箱已发送，请查收！")) {
                    window.location.href = "%s";
                }
                </script>
                """ % redirect('/user/login').url)
            else:
                return HttpResponse("""
                <script type="text/javascript">
                if (confirm("邮箱未注册，请先进行注册！")) {
                    window.location.href = "%s";
                }
                </script>
                """ % redirect('/user/login').url)
    return render(request, 'user/forget_pwd.html', {'form': form})


def reset_pwd_url(request, active_code):
    '''密码重置'''
    if request.method != 'POST':
        form = ModifyPwdForm()
    else:
        form = ModifyPwdForm(request.POST)
        if form.is_valid():
            record = EmailVerifyRecord.objects.get(code=active_code)
            email = record.email
            user = User.objects.get(email=email)
            # user.username = email
            user.email = email
            user.password = make_password(form.cleaned_data.get('password'))
            user.save()
            return HttpResponse("""
                    <script type="text/javascript">
                    if (confirm("密码修改成功，请登录！")) {
                        window.location.href = "%s";
                    }
                    </script>
                    """ % redirect('/user/login').url)
    context = {'form': form}
    return render(request, 'user/reset_pwd.html', context)


@login_required(login_url='/user/login')
def user_profile(request):
    user = User.objects.get(username=request.user)
    return render(request, 'user/user_profile.html', {'user': user})


def logo_out(request):
    logout(request)
    return redirect('/')


@login_required(login_url='/user/login')
def edit_userInformation(request):
    '''编辑用户信息'''
    # 获取当前登录用户
    user = User.objects.get(id=request.user.id)
    if request.method == 'POST':
        try:
            userprofile = user.userprofile  # 实例模型
            form = UserForm(request.POST, instance=user)
            user_profile_form = UserProfileForm(request.POST, request.FILES, instance=userprofile)  # 向表单填充默认数据
            if form.is_valid() and user_profile_form.is_valid():
                form.save()
                user_profile_form.save()
                return redirect('/user/user_profile')
        except userProfile.DoesNotExist:  # 这里发生错误说明userprofile无数据
            form = UserForm(request.POST, instance=user)  # 填充默认数据 当前用户
            user_profile_form = UserProfileForm(request.POST, request.FILES)  # 空表单，直接获取空表单的数据保存
            if form.is_valid() and user_profile_form.is_valid():
                form.save()
                # commit=False 先不保存，先把数据放在内存中，然后再重新给指定的字段赋值添加进去，提交保存新的数据
                new_user_profile = user_profile_form.save(commit=False)
                new_user_profile.owner = request.user
                new_user_profile.save()
                return redirect('/user/user_profile')

    else:
        try:
            userprofile = user.userprofile
            form = UserForm(instance=user)
            user_profile_form = UserProfileForm(instance=userprofile)
        except userProfile.DoesNotExist:
            form = UserForm(instance=user)
            user_profile_form = UserProfileForm()  # 显示空表单
    return render(request, 'user/edit_userInformation.html', locals())
