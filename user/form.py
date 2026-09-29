# -*- coding:utf-8 –*-
# django提供的表单类来构建表单，并进行有效验证
from django import forms

# 登录表单
from django.contrib.auth.models import User

from user.models import userProfile


class Loginform(forms.Form):
    username = forms.CharField(label='用户名', max_length=32,
                               widget=forms.TextInput(attrs={'class': 'input', 'placeholder': '用户名/邮箱'}))
    password = forms.CharField(label='密码', min_length=6,
                               widget=forms.PasswordInput(attrs={'class': 'input', 'placeholder': '密码'}))

    # 自定义验证表单用户名和密码不能一致
    def clean_password(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')

        if username == password:
            # raise进行表单提示
            raise forms.ValidationError('密码和用户名不能一致！')
        return password


# 用户名/邮箱注册表单
class Registerform(forms.ModelForm):
    password = forms.CharField(label='密码', min_length=6,
                               widget=forms.PasswordInput(attrs={'class': 'input', 'placeholder': '密码'}))
    password1 = forms.CharField(label='再次输入密码', min_length=6,
                                widget=forms.PasswordInput(attrs={'class': 'input', 'placeholder': '再次输入密码'}))
    email = forms.EmailField(label='注册邮箱', max_length=32,
                             widget=forms.EmailInput(attrs={'class': 'input', 'placeholder': '邮箱'}))

    # 从User模型中自动对应创建表单，无需自己创建
    class Meta:
        model = User
        fields = ('email', 'password',)  # 允许编辑的字段

    def clean_email(self):
        ''' 验证邮箱是否被注册'''
        email = self.cleaned_data.get('email')
        exits = User.objects.filter(email=email).exists()
        if exits:
            raise forms.ValidationError('邮箱已经被注册，请重新注册')
        return email

    def clean_password1(self):
        '''验证两次密码是否一致'''
        if self.cleaned_data.get('password') != self.cleaned_data.get('password1'):
            raise forms.ValidationError('两次输入的密码不一致，请重新注册')

        return self.cleaned_data.get('password')


# 创建找回密码表单类
class ForgetPwdForm(forms.Form):
    '''填写邮箱地址表单'''
    email = forms.EmailField(label='请输入注册邮箱地址', min_length=4,
                             widget=forms.EmailInput(attrs={'class': 'input', 'placeholder': '邮箱'}))


# 创建重置密码类
class ModifyPwdForm(forms.ModelForm):
    password = forms.CharField(label='请输入新密码', min_length=6,
                               widget=forms.PasswordInput(attrs={'class': 'input', 'placeholder': '请输入新密码'}))
    password1 = forms.CharField(label='再次输入新密码', min_length=6,
                                widget=forms.PasswordInput(attrs={'class': 'input', 'placeholder': '再次输入新密码'}))

    class Meta:
        model = User
        fields = ('password',)  # 允许编辑的字段

    def clean_password1(self):
        '''验证两次密码是否一致'''
        if self.cleaned_data.get('password') != self.cleaned_data.get('password1'):
            raise forms.ValidationError('两次输入的密码不一致，请重新修改')

        return self.cleaned_data.get('password')


class UserForm(forms.ModelForm):
    email = forms.EmailField(widget=forms.EmailInput(attrs={'class': 'input'}))

    class Meta:
        model = User
        fields = ('email',)


class UserProfileForm(forms.ModelForm):
    """用户信息的表单定义."""
    birthday = forms.DateField(widget=forms.DateInput(format='%Y-%m-%d', attrs={'type': 'date'}))#此处防止输入日期格式错误导致系统运行异常，直接进行格式固定

    class Meta:
        """用户信息表单的元定义."""
        model = userProfile
        fields = ('nike_name', 'birthday', 'gender', 'address', 'image',)
