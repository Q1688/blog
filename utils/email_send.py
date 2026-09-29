# -*- coding:utf-8 –*-
from django.core.mail import send_mail
import random
import string
from user.models import EmailVerifyRecord


def random_str(randomlength=8):
    '''生成8位数验证码'''
    chars = string.ascii_letters + string.digits  # ascii_letters库是生成a-zA-Z，digits库是生成0-9字符串
    strcode = ''.join(random.sample(chars, randomlength))
    return strcode


def send_register_email(email, sent_type='register'):
    # 将验证码保存到数据库
    email_code = EmailVerifyRecord()
    code = random_str()
    email_code.code = code
    email_code.email = email
    email_code.send_type = sent_type
    email_code.save()

    if sent_type == 'register':
        email_title = '博客的注册激活链接'
        email_body = '请点击以下链接激活账号：http:/127.0.0.1:8000/user/active/{0}'.format(code)

        send_status = send_mail(email_title, email_body, '1063075593@qq.com', [email],fail_silently=False)# fail_silently=False如果设置为True，则不抛出异常，但不会看到错误信息
        # if send_status:
        #     pass
        return send_status


    elif sent_type == 'forget':
        email_title = '找回密码链接'
        email_body = '请点击以下链接修改密码：http:/127.0.0.1:8000/user/reset_pwd_url/{0}'.format(code)

        send_status= send_mail(email_title, email_body, '1063075593@qq.com', [email],fail_silently=False)
        # if send_status:
        #     pass
        return send_status