---
title: csdn博文迁移至hexo心路历程
date: 2019-04-18 18:16:15
description:
toc: true
author: tabris
# 图片推荐使用图床(腾讯云、七牛云、又拍云等)来做图片的路径.如:http://xxx.com/xxx.jpg
img: 
# 如果top值为true，则会是首页推荐文章
top: false
# 如果要对文章设置阅读验证密码的话，就可以在设置password的值，该值必须是用SHA256加密后的密码，防止被他人识破
password: 
# 本文章是否开启mathjax，且需要在主题的_config.yml文件中也需要开启才行
mathjax: false
summary: "某天我之前的`hexo`主题被自己玩坏了, 决定换一个主题,\n同时突然想把之前`CSDN`博文迁移进来,CSDN这个网站是越来越傻逼了.最终选择了hexo-theme-matery主题,\n但最艰难的博文迁移过程算是完成了,但仍然有很大瑕疵.."
categories: 
tags:
---



>   某天我之前的`hexo`主题被自己玩坏了, 决定换一个主题,
>
>   同时突然想把之前`CSDN`博文迁移进来,CSDN这个网站是越来越傻逼了.
>
>   最终选择了[hexo-theme-matery](https://codeload.github.com/blinkfox/hexo-theme-matery)主题,
>
>   但最艰难的博文迁移过程算是完成了,但仍然有很大瑕疵..

# HEXO更换主题,并配置

有了[easyHexo](https://easyhexo.com/)这个项目做起来还是很容易的,里面很详细的介绍了`hexo`博客的构建部署及主题使用以及配置.

我这里就不在赘述了,只说几个坑吧.

## 代码高亮问题

1.  我采用的 [hexo-prism-plugin](https://github.com/ele828/hexo-prism-plugin) 是一个代码高亮的插件,但是对`c++`代码的编写是必须为

    ```md
    ​```cpp
    ​```
    ```

    不能为

    
    
    ```md
    ​```c++
    ​```
    ```

## 渲染问题

之前的文件中存在`}}`这样的字符,`hexo`渲染的时候就会出现报错

```javascript
FATAL Something's wrong. Maybe you can find the solution here: http://hexo.io/docs/troubleshooting.html
Template render error: (unknown path) [Line 31, Column 21]
expected variable end
```

参考了[文章一](<https://blog.csdn.net/chwshuang/article/details/52350559>),[文章二](<https://www.jianshu.com/p/738ebe02029b>) 找到问题并解决



# CSDN博文迁移



我这里有`300+`篇博文在`csdn`上,所以很难人工迁移,所以选择`python`爬虫的方式爬取迁移,

百度一通找了好多爬虫,不是太老了,就是效果不行,

最终我找到了一个能凑合用的脚本,[csdn-blog-export](<https://github.com/gaocegege/csdn-blog-export>)



它能够自动爬取博文,并输出`markdown`文本或者`html`的代码,

但是年代还是过于老了, `CSDN`的网站`html`结构已经大变,于是进行了魔改,终于可以爬取到信息了,

期间主要是有几个问题

1.   不适应新的网站`html`机构, 

    >   魔改后可用

2.   缺少`hexo`需要的`yaml front matter`, 

    >   添加此函数 获得`yaml front matter`
    >
    >   
    >
    >   ```python
    >   def getHexoTitleMarkdown(self, detail):
    >       title = '<' + \
    >               html2text.html2text(detail.find(class_='article-title-box').span.prettify()).rstrip('\n') + \
    >               '>' + \
    >               html2text.html2text(detail.find(class_='title-article').prettify()).rstrip('\n')
    >       date = html2text.html2text(detail.find(class_='time').prettify()).replace('\n', '')
    >       date = date[:4] + '-' + date[5:7] + '-' + date[8:10] + ' ' + date[-8:]
    >       tags = detail.find_all(class_='tag-link')
    >       tags = map(deleteURL, map(lambda x: x.replace('\n', ''), map(html2text.html2text, map(lambda x: x.prettify(), tags))))
    >       # print(tags)
    >       tags = ''.join(map(lambda x: '  - ' + x + '\n', map(lambda x: x.replace('=', '').strip(), tags)))
    >       str = u'''---
    >   title: %s
    >   date: %s
    >   description:
    >   toc: true
    >   author: tabris
    >   # 图片推荐使用图床(腾讯云、七牛云、又拍云等)来做图片的路径.如:http://xxx.com/xxx.jpg
    >   img: 
    >   # 如果top值为true，则会是首页推荐文章
    >   top: false
    >   # 如果要对文章设置阅读验证密码的话，就可以在设置password的值，该值必须是用SHA256加密后的密码，防止被他人识破
    >   password: 
    >   # 本文章是否开启mathjax，且需要在主题的_config.yml文件中也需要开启才行
    >   mathjax: false
    >   summary: 这是你自定义的文章摘要内容，如果这个属性有值，文章卡片摘要就显示这段文字，否则程序会自动截取文章的部分内容作为摘要
    >   categories: OJ算法题
    >   tags:
    >   %s
    >   ---
    >   
    >   ''' % (title.replace('\n', '').replace(':', ' '), date.replace(':', ' '), tags.replace(':', ' '))
    >       # print(str)
    >       # exit(0)
    >       return str
    >   ```

3.  爬取得到的`markdown`文本格式不是很理想

    >   **这个问题并没有解决**
    >
    >   最开始查看了这个脚本使用的`html`转`markdown`模块([html2text](https://github.com/aaronsw/html2text))最后一次维护是`2012`年,
    >
    >   于是就换了一个新模块[html2markdown](),可最后发现这个模块的效果还不如[html2text](https://github.com/aaronsw/html2text), 于是放弃.



------

最终迁移到了<https://tabris.top/categories/OJ算法题/>,

迁移脚本在这里[csdn2hexo](<https://github.com/tabris233/Spider/tree/master/csdn2hexo>)