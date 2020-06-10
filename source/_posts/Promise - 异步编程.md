---
title: Promise - 异步编程
date: 2020/5/3 20:00:00
categories: 基础知识
---

Promise 的相关知识，内容包括简介、用法。


## 一、简介


「异步 + 回调」能够写出异步任务，但是这样的组合，当出现很多回调的时候，就出现了“回调地狱”

前端结合 Promise 和 JS，制定了 Promise 规范，详细描述了 Promise 的原理和使用方法

## 二、用法


在异步代码中，return 一个 Promise 的实例


```
return new Promise((resolve,reject)={
	// 任务成功，调用 resolve(result)
  // 任务失败，调用 reject(error)
})
```


- .then(success,fail) 传入成功函数和失败函数



_「@浪里淘沙的小法师」_

