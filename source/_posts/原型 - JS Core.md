---
title: 原型 - JS Core
date: 2020/4/30 18:00:00
index_img: /img/basis.jpg
categories: 基础知识
---

原型的相关知识，内容包括原型链、公式、功能、举例。
_
_之前写过一篇有关原型的总结：_[_点击这里_](https://juejin.im/post/5e5377ee518825494c75e49d)


## 一、原型链


**JavaScript 是原型链的方式继承**


- 每个实例对象（ object ）都有一个私有属性（称之为 __proto__ ）
- 指向它的构造函数的原型对象（prototype ）
- 该原型对象也有一个自己的原型对象( __proto__ ) ，层层向上直到一个对象的原型对象为 null



## 二、公式
**
<实例对象>.__proto__ === <其构造函数>.prototype


## 三、功能
**

- 当试图访问一个对象的属性时，它不仅仅在该对象上搜寻，还会搜寻该对象的原型
- 以及该对象的原型的原型
- 依次层层向上搜索，直到找到一个名字匹配的属性或到达原型链的末尾



## 四、举例


```
let object = {name:'Eddie',age:18}
let array = [1,2,3,4,5]
let f = function(){console.log('Hello')}

object.__proto__ === Object.prototype  // true
array.__proto__ === Array.prototype  // true
f.__proto__ === Function.prototype  // true
array.__proto__.__proto__ === Object.prototype  // true
f.__proto__.__proto__ === Object.prototype  // true

object.hasOwnProperty('name')  // true
array.push(6)  // array 的值变为 [1,2,3,4,5,6]
array.toString()  // array 的值变为 "1,2,3,4,5,6"
```


object 对象下无 hasOwnProperty 方法，但能够使用该方法，为什么呢？因为原型呀，hasOwnProperty 保存在 object 的构造函数 Object 的原型上面，object 下有的私有属性 __proto__，指向了 Object 下的 prototype


array.push(6) 中能够使用 push 方法也是这个原理，那为什么还能用 toSring 方法呢？因为原型链呀，array 的原型的原型是 Object 的原型，其下有 toString 方法


_「@浪里淘沙的小法师」_


_

