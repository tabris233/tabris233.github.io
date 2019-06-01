---
title: Python学习笔记
date: 2018-03-07 20:12:11
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
categories: 编程语言
tags:
  - python
---

抄写了两个Spider,发现对于Python基础的掌握实在是差劲的可以.

于是乎 过来补补基础

一直在[Hackerrank](https://www.hackerrank.com/)上面做Python的题目.知识点覆盖挺全面的,推荐一波.

# Basic

## 乱七八糟小技巧

```python
>>> n,m,*l = ['1','2']
>>> print(n,m,l)
1 2 []
```

## 基本数据类型

### .

#### set

集合是一个无序的，不重复的数据组合，它的主要作用如下：
去重，把一个列表变成集合，就自动去重了
关系测试，测试两组数据之前的交集、差集、并集等关系

```python

list_1 = [1,3,4,7,3,6,7,9]
#去重
list_1 = set(list_1)

list_2 = set([2,6,0,66,22,8,4])
list_3 = set([1,3,7])
print(list_1)
print(list_2)
print(list_3)
print("---------------------------")

#关系测试
#交集(两个列表里面都有的值，这里是4、6)：
print(list_1.intersection(list_2))

#并集（把两个列别合并起来，然后去重）：
print(list_1.union(list_2))

#差集（把list_1里面有的而list_2里面没有的取出来）：
print(list_1.difference(list_2))
#对称差集（两个列表里面，互相没有的取出来，也就是只去掉那些互相都有的值）
print(list_1.symmetric_difference(list_2))

#子集（判断list_1是否包含了list_3里面的所有值）
print(list_3.issubset(list_1))
#父集（判断list_1是否为list_3的父集）
print(list_1.issuperset(list_3))

#无交集（判断list_3和list_4是否完全没有任何交集）
list_4 = set([5,6,8])
print(list_3.isdisjoint(list_4))

#-----------------------关系测试的另一种写法：
'''
s = set([3,5,9,10])      #创建一个数值集合
t = set("Hello")         #创建一个唯一字符的集合

a = t | s          # t 和 s的并集
b = t & s          # t 和 s的交集
c = t – s          # 求差集（项在t中，但不在s中）
d = t ^ s          # 对称差集（项在t或s中，但不会同时出现在二者中）

基本操作：
t.add('x')            # 添加一项
s.update([10,37,42])  # 在s中添加多项

使用remove()可以删除一项：

t.remove('H')   #有就删除，没有就报错
t.pop() #随机弹出一个
t.discard('H')  #有就删除，没有也不会报错

len(s)
set 的长度

x in s
测试 x 是否是 s 的成员

x not in s
测试 x 是否不是 s 的成员

s.issubset(t)
s <= t
测试是否 s 中的每一个元素都在 t 中

s.issuperset(t)
s >= t
测试是否 t 中的每一个元素都在 s 中

s.union(t)
s | t
返回一个新的 set 包含 s 和 t 中的每一个元素

s.intersection(t)
s & t
返回一个新的 set 包含 s 和 t 中的公共元素

s.difference(t)
s - t
返回一个新的 set 包含 s 中有但是 t 中没有的元素

s.symmetric_difference(t)
s ^ t
返回一个新的 set 包含 s 和 t 中不重复的元素

s.copy()
返回 set “s”的一个浅复制
```

## 排序

### .

#### 对字符定义优先级

将需要排序的字符集放到一个字符串中
在这个字符串中越靠前的字符排序后越靠前

```python
order = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1357902468'
print(*sorted(input(), key=order.index), sep='')
```


#### 关键字排序

```python
N, M = map(int, input().split())    # Ｎ行 Ｍ列
rows = [input() for _ in range(N)]  # 一行 为一组数据
K = int(input()) # 以第几为关键字

for row in sorted(rows, key=lambda x: int(x.split()[K])):# lambda 匿名函数
    print(row)

```

## 字符串

### .

#### 26字母

```Python
import string
alpha = string.ascii_lowercase
```

#### 字符串反转

```Python
>>>　s = 'abcde'
>>>　print(s[::-1])
edcba
```

#### 字符串格式化输出

个人喜欢最新的`'{}'.format()`的形式,不仅写起来更方便一些,还有旧方法不能实现的操作.感觉以后可能完全取缔旧的方法.

[.format的介绍(与旧方法的对比)](https://pyformat.info/)


输出一行 '-'
```Python
'{:-{align}{width}}'.format( '',align='>', width = 5)
```
输出
```
-----
```

## 函数(function)

可更改(mutable)与不可更改(immutable)对象
在 python 中，strings, tuples, 和 numbers 是不可更改的对象，而 list,dict 等则是可以修改的对象。

- 不可变类型：变量赋值 a=5 后再赋值 a=10，这里实际是新生成一个 int 值对象 10，再让 a 指向它，而 5 被丢弃，不是改变a的值，相当于新生成了a。
- 可变类型：变量赋值 la=[1,2,3,4] 后再赋值 la[2]=5 则是将 list la 的第三个元素值更改，本身la没有动，只是其内部的一部分值被修改了。

python 函数的参数传递：

- 不可变类型：类似 c++ 的值传递，如 整数、字符串、元组。如fun（a），传递的只是a的值，没有影响a对象本身。比如在 fun（a）内部修改 a 的值，只是修改另一个复制的对象，不会影响 a 本身。
- 可变类型：类似 c++ 的引用传递，如 列表，字典。如 fun（la），则是将 la 真正的传过去，修改后fun外部的la也会受影响

python 中一切都是对象，严格意义我们不能说值传递还是引用传递，我们应该说传不可变对象和传可变对象。


### .

#### eval()

eval(string) 对于一个字符串，相当与**运行**这个字符串所代表的python代码

```python
>>> x = 1
>>> eval('x+1')
>>> print(eval('x+1'))
2
```


# 各种库

导入库
```python
import 库 #使用时需要 `库.函数()`
from 库 import 函数 # 使用时直接 `函数()` 即可
```

## collections

```python
import collections
```

### Counter

计数用的函数

###  defaultdict

可以简单理解为一个**map**,

```python
a = defaultdict([Type of value])
------
a['key'] type is [Type of value]
```

### deque

```python
>>> from collections import deque
>>> d = deque()
>>> d.append(1)
>>> print d
deque([1])
>>> d.appendleft(2)
>>> print d
deque([2, 1])
>>> d.clear()
>>> print d
deque([])
>>> d.extend('1')
>>> print d
deque(['1'])
>>> d.extendleft('234')
>>> print d
deque(['4', '3', '2', '1'])
>>> d.count('1')
1
>>> d.pop()
'1'
>>> print d
deque(['4', '3', '2'])
>>> d.popleft()
'4'
>>> print d
deque(['3', '2'])
>>> d.extend('7896')
>>> print d
deque(['3', '2', '7', '8', '9', '6'])
>>> d.remove('2')
>>> print d
deque(['3', '7', '8', '9', '6'])
>>> d.reverse()
>>> print d
deque(['6', '9', '8', '7', '3'])
>>> d.rotate(3)
>>> print d
deque(['8', '7', '3', '6', '9'])
```

# 自省

## .

### .

#### getattr()

```python
'''
getattr(object, name[, default]) -> value
其中 name 可以是字符串.
这样的话 相当于 name可以用字符串代替 就不用一大堆`if elif else`了
'''
getattr(object, name[, default]) -> value
<==>
object.name(value)
```