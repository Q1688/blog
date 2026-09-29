from django.contrib.auth.models import User
from django.contrib.auth.admin import admin, UserAdmin
from .models import userProfile, EmailVerifyRecord

# Register your models here.
# 通过unregister将User取消注册
admin.site.unregister(User)
# 定义关联对象的样式，StackedInline为纵向排列每一行，TabularInline为并排排列
class UserProfileInline(admin.StackedInline):
    model = userProfile  # 关联的模型为自己编写的模型


# 关联UserProfile,这里继承UserAdmin
class UserProfileAdmin(UserAdmin):
    # 内联UserProfile
    inlines = (UserProfileInline,)

# 重新注册user模型
admin.site.register(User, UserProfileAdmin)

@admin.register(EmailVerifyRecord)
class Admin(admin.ModelAdmin):
    list_display = ('code',)
