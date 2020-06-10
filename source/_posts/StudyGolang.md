---
title: StudyGolang
date: 2019-11-08 15:33:11
description: ["Golang"]
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
  - Golang
---



[Go 中文主页](https://go-zh.org/)

先把这个教程看完 - [Go 指南](https://tour.go-zh.org/)

然后就去写代码

完毕

------

# go 语言常用的一些代码 (刷题

### 自定义排序

[【Go语言】基本类型排序和 slice 排序](https://itimetraveler.github.io/2016/09/07/【Go语言】基本类型排序和 slice 排序/)

```go
package main
 
import (
    "fmt"
    "sort"
)
 
type Person struct {
    Name string
    Age  int
}
 
// 按照 Person.Age 从大到小排序
type PersonSlice [] Person
 
func (a PersonSlice) Len() int {    	 // 重写 Len() 方法
    return len(a)
}
func (a PersonSlice) Swap(i, j int){     // 重写 Swap() 方法
    a[i], a[j] = a[j], a[i]
}
func (a PersonSlice) Less(i, j int) bool {    // 重写 Less() 方法， 从大到小排序
    return a[j].Age < a[i].Age
}
 
func main() {
    people := [] Person{
        {"zhang san", 12},
        {"li si", 30},
        {"wang wu", 52},
        {"zhao liu", 26},
    }
 
    fmt.Println(people)
 
    sort.Sort(PersonSlice(people))    // 按照 Age 的逆序排序
    fmt.Println(people)
 
    sort.Sort(sort.Reverse(PersonSlice(people)))    // 按照 Age 的升序排序
    fmt.Println(people)
 
}
```

### 比较大小

```go
func max(a, b int) int {
	if a > b {
		return a
	} else {
		return b
	}
}

func min(a, b int) int {
	if a < b {
		return a
	} else {
		return b
	}
}
```

### 模拟C++的Vector

```go
/**
 * 一维
 * 初始长度为空
 */
ans := make([]int, 0)      // 相当于C++ vector<int> ans;
ans = append(ans, 23)      // 相当于C++ ans.push_back(23);

/**
 * 二维切片
 * LeetCode 5280 
 */
func groupThePeople(groupSizes []int) [][]int {
    ans := make([][]int, 0)            // 相当于C++ vector<vector<int> > ans;

    cnt := make([][]int, 500)          // 相当于C++ vector<int> cnt[500];
 
    for i, v := range groupSizes {
        cnt[v] = append(cnt[v], i)     // 相当于C++ cnt[v].push_back(i);
        if len(cnt[v]) == v {
            ans = append(ans, cnt[v])  // 相当于C++ ans.push_back(cnt[v]);
            cnt[v] = make([]int, 0)    // 相当于C++ cnt.clear();
        }
    }
    return ans
}
```

------

标题：Golang 学习
作者：[tabris233](http://39.100.224.149:8080/)
地址：http://39.100.224.149:8080/articles/2019/11/04/1572831884728.html