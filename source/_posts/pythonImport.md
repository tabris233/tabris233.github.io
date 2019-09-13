---
title: 'python import'
date: 2019-8-26 12:43:03
description: ["python import研究,持续更新"]
toc: true
author: tabris
# 图片推荐使用图床(腾讯云、七牛云、又拍云等)来做图片的路径.如:http://xxx.com/xxx.jpg
img: 
# 如果top值为true,则会是首页推荐文章
top: false
# 如果要对文章设置阅读验证密码的话,就可以在设置password的值,该值必须是用SHA256加密后的密码,防止被他人识破
password: 
# 本文章是否开启mathjax，且需要在主题的_config.yml文件中也需要开启才行
mathjax: false
summary: 
categories: 实用技能
tags:
  - python

---

> ***未完待续***

# python import研究

​	`python`用了好久了, 对它的`import`规则一直都很懵,借此机会梳理下.



### 首先是导包.

导入同目录下的包, 或者安装好的第三方模块, 或者python自带的模块

```python
import module_name
```

导入当前目录中某一文件夹里面的`python`模块

```python
from dir import module_name
```

