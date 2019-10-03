#!/bin/sh

# 更改自己的主题配置
cp themes/_config.yml themes/matery/_config.yml
cp -r themes/reward themes/matery/source/medias/reward
cp -r themes/qiu.jpg themes/matery/source/medias/avatar.jpg
cp -r themes/qiu.jpg themes/matery/source/favicon.png

# hexo 
hexo clean
hexo generat