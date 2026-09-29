from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.core.paginator import Paginator
from django.db.models import Q, F
from django.shortcuts import render, get_object_or_404, redirect

from blogmessage.form import CommentForm
from blogmessage.models import Category, Article, Comment
from user.models import userProfile


def index(request):
    # 查询文章相关信息
    article_list = Article.objects.all().order_by('id')  # 查询所有的文章
    # 分页方法
    paginator = Paginator(article_list, 5)  # 第二个参数代表每页显示几篇文章
    page_num = request.GET.get('page')  # 获取页码
    page_obj = paginator.get_page(page_num)

    # context = {'article_list': article_list} #
    context = {'page_obj': page_obj}
    return render(request, 'index.html', context)


def category_list(request, category_id):
    category = get_object_or_404(Category, id=category_id)  # 获取文章分类，若没有返回404错误
    # 获取当前分类下的所有文章
    article_list = category.article_set.all()
    # 分类分页逻辑
    paginator = Paginator(article_list, 5)  # 第二个参数代表每页显示几篇文章
    page_num = request.GET.get('page')  # 获取页码
    page_obj = paginator.get_page(page_num)
    context = {'category': category, 'page_obj': page_obj}
    return render(request, 'category_list.html', context)


@login_required(login_url='/user/login')
def article_detail(request, article_id):
    # 文章详情
    article = get_object_or_404(Article, id=article_id)
    # 用文章id来实现上下文
    prev_article = Article.objects.filter(id__lt=article_id).last()  # 上一篇
    next_article = Article.objects.filter(id__gt=article_id).first()  # 下一篇
    # 浏览器统计
    try:
        article_id = int(article_id)
        if article_id <= 0:
            raise ValueError("Invalid article_id")
    except (ValueError, TypeError):
        raise ValidationError("Invalid article_id")
    # 浏览器统计
    Article.objects.filter(id=article_id).update(pv=F('pv') + 1)  # F()为竞争机制来统计访问量

    # 留言评论逻辑处理
    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            form.save()
            # 返回当前路径
            return redirect(request.path)
    else:
        nike_name = request.user.userprofile.nike_name  # 获取昵称
        initial_data = {'name': nike_name, 'email': request.user.email, 'article': article}
        form = CommentForm(initial_data)
    message = Comment.objects.filter(article=article)

    context = {'article': article, 'prev_article': prev_article, 'next_article': next_article, 'form': form,
               'message': message}
    return render(request, 'article_list.html', context)


def search(request):
    '''收索试图'''
    keyword = request.GET.get('keyword')  # 获取表单中输入的数据
    # 没有搜索默认显示所有文章
    if not keyword:
        article_list = Article.objects.all()
    else:
        # 包含查询的方法，用Q对象来组合复杂查询，title__icontains之间用双下划线,icontains中的i表示忽略大小写的包含
        article_list = Article.objects.filter(
            Q(title__icontains=keyword) | Q(desc__icontains=keyword) | Q(content__icontains=keyword))
    # 分页逻辑
    paginator = Paginator(article_list, 5)  # 第二个参数代表每页显示几篇文章
    page_num = request.GET.get('page')  # 获取页码
    page_obj = paginator.get_page(page_num)
    # context = {'article_list':article_list}
    context = {'page_obj': page_obj}

    return render(request, 'index.html', context)
