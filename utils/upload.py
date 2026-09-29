# -*- coding:utf-8 –*-
import os
import uuid
from pathlib import Path

from django.views.decorators.csrf import csrf_exempt  # 取消csrftoken验证
from django.http import JsonResponse  # 返回json格式的数据
from django.conf import settings      # 配置文件

from django.core.exceptions import ValidationError
from PIL import UnidentifiedImageError,Image
import exifread
from io import BytesIO

@csrf_exempt
def upload_file(request):
    '''ckeditor5图片上传'''
    try:# 对图片进行安全检测
        # 读取上传的文件
        image = Image.open(request.FILES.get('upload'))
        # 对上传的大图片进行处理
        if image.size[0]>1000 and image.size[1] >1000:
            # 调整图片大小，例如最大宽度800px，最大高度800px
            image.thumbnail((1000, 1000))
        image.verify()  # 确保图片未损坏
        data = BytesIO() # 在内存中创建一个可读写的二进制数据缓冲区‌，模拟文件对象的行为，但所有操作都在内存中完成，无需涉及磁盘 I/O
        # image.save(data, format='jpeg')  # 使用适当的格式保存图片
        data.seek(0) # 将文件或流的读写指针移动到起始位置（即偏移量为 0 的位置）‌。
        tags = exifread.process_file(data)  # 读取Exif数据，如果有恶意代码通常会在这些元数据中隐藏
        if 'Image Description' in tags and tags['Image Description'].values[0]:
            raise ValueError("Image contains suspicious metadata.")
    except (IOError, UnidentifiedImageError) as e:
        raise ValidationError("无效的图片文件")

    # 获取写文档表单上传的图片名，并对图片进行如下操作
    upload = request.FILES.get('upload')
    # 对含有-符号的uuid值通过-进行分割，然后拼接分割的数组值，返回纯字符串的uid
    uid = ''.join(str(uuid.uuid4()).split('-'))
    # 修改图片名称，将分割后的名称替换成uid
    names = str(upload.name).split('.')
    names[0] = uid
    names[1] = 'jpeg'
    # 修改过的图片格式
    upload.name = '.'.join(names)
    new_path = os.path.join(settings.MEDIA_ROOT, 'upload/', upload.name)
    # 上传图片
    with open(new_path, 'wb+') as f:
        for chunk in upload.chunks():
            f.write(chunk)

    # 构造要求的数据格式并返回
    filename = upload.name
    url = '/media/upload/' + filename
    retdata = {'url': url,  # 上传图片的URL
               'uploaded': '1',  # 上传图片的标识
               'fileName': filename  # 上传图片的名称
               }
    return JsonResponse(retdata)


