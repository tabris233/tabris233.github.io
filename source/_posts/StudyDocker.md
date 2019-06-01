---
title: StudyDocker
date: 2019-1-10 17:21:03
description: ["Docker 轻量级虚拟化"]
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
  - Linux
  - docker
  - 虚拟化
---



操作环境: Arch & manjaro 

docker命令行管理工具使用的`dockly` 但仍然有缺陷,以后再找找 有没有其他更好用的命令行工具.

教程先看了一遍 [B站的尚硅谷教程](https://www.bilibili.com/video/av27122140) 有些av号的顺序不对.  看这个就行了.

tabris's 阿里云镜像加速器: https://oj7znbfj.mirror.aliyuncs.com



# 安装篇

命令安装`docker`本体

```shell
sudo pacman -S docker
```



> 同时建议安装`dockly`作为docker的命令行管理软件.
>
> https://www.npmjs.com/package/dockly

非root用户运行docker是执行如下命令

```shell
sudo usermod -aG docker $USER #your usrname
```

执行如下命令启动docker服务

```shell
systemctl enable docker  
systemctl start docker
```

## 镜像加速

鉴于国内网络问题，后续拉取 Docker 镜像十分缓慢，我们可以需要配置加速器来解决，我使用的是阿里云的镜像加速器: https://oj7znbfj.mirror.aliyuncs.com

新版的 `Docker` 使用 `/etc/docker/daemon.json（Linux）` 或者 `%programdata%\docker\config\daemon.json（Windows）` 来配置 `Daemon`。

请在该配置文件中加入（没有该文件的话，请先建一个）：

```json
{
    "registry-mirrors": ["https://oj7znbfj.mirror.aliyuncs.com"]
}
```

