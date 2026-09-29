# -*- coding:utf-8 –*-
from django import forms
from django.contrib.auth.models import User

from blogmessage.models import Comment


class CommentForm(forms.ModelForm):
    '''评论表单用于发表博客的评论'''
    class Meta:
        model = Comment
        fields = ['name','email','content','article',]
        widgets = {'content': forms.Textarea(attrs={'rows':3})}
        labels = {
            'name':'您的名称',
            'email':'您的邮箱',
            'article': '文章标题',
            'content':'留言内容',
        }