# -*- coding:utf-8 –*-
# 对文章内容解析markdown语法格式

from django.template import Library
import markdown
register = Library()

@register.filter
def md(value):
    return markdown.markdown(value)