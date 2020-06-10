---
title: AJAX - JS Core
date: 2020/4/30 20:00:00
categories: 基础知识
---

AJAX 的相关知识，内容包括简介、作用、用法、window.JSON。


## 一、简介


AJAX 全名是“Async JavaScript and XML”，主要内容为用 JavaScript 发请求和收响应

- AJAX 是浏览器的功能
- 浏览器可以发请求，收响应
- 它在 window 上加了一个 XMLHttpRequest 函数
- 用这个构造函数（类）可以构造一个对象



目前前端更流行使用 axios 发送 AJAX

## 二、作用


AJAX 让我们可以把页面拆成各个不同的部分


- 不必一开始把请求全做了，它使得请求更灵活
- 可以在用户点击的时候请求这个部分
- 可以做到轻量级的请求



## 三、用法


可以使用 AJAX 加载不同内容，步骤如下


1. 创建 HttpRequest 对象（全称是 XMLHttpRequest）
1. 调用对象的 open 方法
1. 监听对象的 onreadystatechange 事件
1. 调用对象的 send 方法（发送请求）



```

const request = new XMLHttpRequest();
request.open("GET", "/5.json");
request.onreadystatechange = () => {
  if (request.readyState === 4) {
    if (request.status >= 200 && request.status < 300) {
      const object = JSON.parse(request.response);
      myName.textContent = object.name;
    }
  }
};
request.send();

```


## 四、window.JSON


window 下挂一个 JSON 对象，其下的两个函数用做数据类型转换


- JSON.parse  将 JSON 字符串转为 JavaScript 数据
- JSON.stringify  将 JavaScript 数据转为 JSON 字符串



_「@浪里淘沙的小法师」_
