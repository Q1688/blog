from django.contrib import admin

# Register your models here.
# 将models.py文件中的模型引进来
from blogmessage.models import Category, Tag, Article, Sidebar, Comment

admin.site.register(Category)
admin.site.register(Tag)
admin.site.register(Sidebar)


class ArticleAdmin(admin.ModelAdmin):
    ''' 文章详情管理 '''

    list_display = ('id', 'title', 'category', 'tags', 'owner', 'pv', 'is_hot', 'pub_date',)
    list_filter = ('owner',)
    search_fields = ('title', 'desc',)
    list_editable = ('is_hot',)
    list_display_links = ('id', 'title',)

    class Media:
        css = {
            'all': ('ckeditor5/cked.css',)
        }

        js = (
            'jquery/jquery.js',
            'ckeditor5/ckeditor.js',  # 主要文件
            'ckeditor5/translations/zh.js',  # 语言支持
            'ckeditor5/config.js'
        )


admin.site.register(Article, ArticleAdmin)


class CommentAdmin(admin.ModelAdmin):
    list_display = ('content', 'name', 'email', 'article')
    search_fields = ['content', 'name', 'email']
    list_filter = ['name', 'email', 'article']


admin.site.register(Comment, CommentAdmin)
