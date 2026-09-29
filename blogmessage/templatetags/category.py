# -*- coding:utf-8 –*-
# 在这里自定义模板标签

from django import template

from blogmessage.models import Category, Article, Sidebar, Comment

register = template.Library()


@register.simple_tag
def get_category_list():
    # 全站显示文章的分类
    return Category.objects.all()


@register.simple_tag
def get_sidebar_list():
    # 侧边栏
    return Sidebar.get_sidebar()


@register.simple_tag
def get_new_article():
    # 最新文章修改时间显示出来，最多显示8条
    return Article.objects.order_by('-pub_date')[:8]


@register.simple_tag
def get_hot_article():
    # 手动热门推荐
    return Article.objects.filter(is_hot=True)[:8]


@register.simple_tag
def get_hot_pv_article():
    # 根据浏览量热门推荐
    return Article.objects.order_by('-pv')[:8]


@register.simple_tag
def get_commnet():
    # 最新留言按照创建时间显示出来，最多显示10条
    return Comment.objects.order_by('-created')[:10]
