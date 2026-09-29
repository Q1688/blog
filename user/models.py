from django.utils import timezone
from django.contrib.auth.base_user import AbstractBaseUser
from django.db import models
from django.contrib.auth.models import User, AbstractUser


# Create your models here.
class userProfile(models.Model):
    USER_GENDER_TYPE = (
        ('male', '男'),
        ('female', '女'),
    )
    # on_delete删除用户时将相关信息进行删除
    owner = models.OneToOneField(User, on_delete=models.CASCADE)  # 一对一关系
    nike_name = models.CharField('昵称', max_length=50, blank=True, default='')
    birthday = models.DateField('生日', null=True, blank=True, default=timezone.now)
    email = models.EmailField('邮箱', max_length=254, default='')
    gender = models.CharField('性别', max_length=6, choices=USER_GENDER_TYPE, default='male')
    address = models.CharField('地址', max_length=100, blank=True, default='')
    image = models.ImageField(upload_to='images/%Y/%m', default='images/default.png', max_length=100,
                              verbose_name='用户头像')

    class Meta:
        # 对模型表进行重新命名
        verbose_name = '用户数据'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.owner.username


class EmailVerifyRecord(models.Model):
    '''邮箱验证码校验记录'''
    SEND_YTPE_CHOICES = (('register', '注册'), ('forget', '找回密码'))
    code = models.CharField('验证码', max_length=20)
    email = models.EmailField('邮箱', max_length=35)
    send_type = models.CharField(choices=SEND_YTPE_CHOICES, default='register', max_length=20)

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.code