---
title: 主流应用换源or镜像加速
date: 2019-4-14 10:59:03
description: ["应用换源"]
toc: true
author: tabris
# 图片推荐使用图床(腾讯云、七牛云、又拍云等)来做图片的路径.如:http://xxx.com/xxx.jpg
img: 
# 如果top值为true,则会是首页推荐文章
top: true
# 如果要对文章设置阅读验证密码的话,就可以在设置password的值,该值必须是用SHA256加密后的密码,防止被他人识破
password: 
# 本文章是否开启mathjax，且需要在主题的_config.yml文件中也需要开启才行
mathjax: false
summary: 
categories: 实用技能
tags:
  - linux
  - git
  - ruby
  - docker
  - npm

---

# Arch or manjaro : pacman

## 启用中国源

```shell
sudo pacman-mirrors -c China
```

## 添加archlinuxcn源

archlinuxcn源至您的 /etc/pacman.conf

```toml
[archlinuxcn]
#The Chinese Arch Linux communities packages.
SigLevel = Optional TrustAll
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
```

# ubuntu

## 1.备份原来的源

```shell
sudo cp /etc/apt/sources.list /etc/apt/sources_init.list
```

将以前的源备份一下，以防以后可以用的。

## 2.更换源

```shell
sudo gedit /etc/apt/sources.list
```

使用gedit打开文档，将下边的阿里源复制进去，然后点击保存关闭。

### 阿里源

```typescript
deb http://mirrors.aliyun.com/ubuntu/ xenial main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main

deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main

deb http://mirrors.aliyun.com/ubuntu/ xenial universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates universe

deb http://mirrors.aliyun.com/ubuntu/ xenial-security main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security universe
```

## 3.更新

### 更新源

```shell
sudo apt-get update
```

复损坏的软件包，尝试卸载出错的包，重新安装正确版本的。

```shell
sudo apt-get -f install
```

### 更新软件

```shell
 sudo apt-get upgrade
```



## 4.其他常用源

### 西电源（只有校内网网线使用，但是不限制流量，还是十分靠谱的）

```
deb http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial main restricted universe multiverse
#deb-src http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial main restricted universe multiverse
deb http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial-security main restricted universe multiverse
#deb-src http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial-security main restricted universe multiverse

deb http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial-updates main restricted universe multiverse
#deb-src http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial-updates main restricted universe multiverse

#deb http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial-backports main restricted universe multiverse
#deb-src http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial-backports main restricted universe multiverse

#deb http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial-proposed main restricted universe multiverse
#deb-src http://linux.xidian.edu.cn/mirrors/ubuntu/ xenial-proposed main restricted universe multiverse

```

### 清华源

```
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse

# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse

# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse

# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse

# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse

```

### 网易源

```
deb http://mirrors.163.com/ubuntu/ wily main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ wily-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ wily-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ wily-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ wily-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ wily main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ wily-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ wily-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ wily-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ wily-backports main restricted universe multiverse

```

# git

```shell
git config --global http.proxy 'socks5://127.0.0.1:1080'
```

### git 设置不用每次输入帐号密码

执行一下 这个命令：

`git config --global credential.helper store`

然后，下次再输入一次 账号密码 就可以了。

# pip

**pip国内的一些镜像**

- 阿里云 <http://mirrors.aliyun.com/pypi/simple/> 
- 中国科技大学 <https://pypi.mirrors.ustc.edu.cn/simple/> 
- 豆瓣(douban) <http://pypi.douban.com/simple/> 
- 清华大学 <https://pypi.tuna.tsinghua.edu.cn/simple/> 
- 中国科学技术大学 <http://pypi.mirrors.ustc.edu.cn/simple/>

**修改源方法：**

**临时使用：** 
可以在使用pip的时候在后面加上-i参数，指定pip源 
eg: `pip install scrapy -i https://pypi.tuna.tsinghua.edu.cn/simple`

**永久修改：** 
**linux:** 
修改 ~/.pip/pip.conf (没有就创建一个)， 内容如下：

```toml
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple

```

 

# ruby

> <https://gems.ruby-china.com/>

```shell
$ gem update --system # 这里请翻墙一下
$ gem -v
2.6.3

$ gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
$ gem sources -l
*** CURRENT SOURCES ***

https://gems.ruby-china.org
# 请确保只有 gems.ruby-china.org
$ gem install rails

```

# docker

## 镜像加速

鉴于国内网络问题，后续拉取 Docker 镜像十分缓慢，我们可以需要配置加速器来解决，我使用的是阿里云的镜像加速器: https://oj7znbfj.mirror.aliyuncs.com

新版的 `Docker` 使用 `/etc/docker/daemon.json（Linux）` 或者 `%programdata%\docker\config\daemon.json（Windows）` 来配置 `Daemon`。

请在该配置文件中加入（没有该文件的话，请先建一个）：

```json
{
    "registry-mirrors": ["https://oj7znbfj.mirror.aliyuncs.com"]
}
```



# npm

安装node.js后，现在的node.js已经自带了npm工具了，但是国外的源很慢，为了解决这个问题，同时使用cnpm替换npm，我们通过切换源，切换到国内淘宝的源中。下面是我的操作过程。简单记录便于以后自己查看。

1. 查看npm版本

   ```shell
   npm -v
   ```

2. 升级npm版本

   ```shell
   npm update
   ```

3. 查看npm配置

   ```shell
   npm config list
   ```

4. 更换源配置

   ```shell
   npm config set registry https://registry.npm.taobao.org
   npm config list / npm config get registery #检查是否替换成功
   ```

5. 安装cnpm插件

   ```shell
   npm install -g cnpm --registry=https://registry.npm.taobao.org
   cnpm -v
   ```

6. 安装包测试

