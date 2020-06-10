---
title: JavaScript 语言
date: 2020/4/27 18:00:00
categories: 基础知识
---

JavaScript 语言的相关知识，内容包括数据类型、函数、对象、类、... 语法。


## 一、数据类型


JavaScript 有七种数据类型，口诀是“四基两空一对象”


- 数值（Number）
- 字符串（String）
- 逻辑值（Boolean）
- Symbol
- undefined
- null
- object



在 JavaScript 中，数组和函数是特殊的对象


```
let number = 1
let string = Hello
let object = {name:'Eddie',age:18}
let array = [1,2,3]
let f = function(){}
```


**一些逻辑值判断**


- 除了这五个 falsy 值，其他都是 True



```
0
NaN
''
undefined
null
```


## 二、函数


### 1. 定义时函数的写法


JS 有三种函数写法，具名函数和匿名函数有 this，箭头函数无 this


```
// 具名函数
function f(x){console.log(x+1)}

f(1)  // 2
f(2)  // 3

// 匿名函数
let f2 = function(x){console.log(x+2)}

f2(1)  // 3
f2(2)  // 4

// 箭头函数
let f3 = (x)=>{console.log(x+3)}

f3(1) // 4
f3(2) // 5
```


### 2. 对象中函数的写法


- 对象中的函数叫做“方法”
- 写法 1、2 有 this，写法 3 无 this



```
let object = {
	f(x){console.log(x+1)},
  f2: function(x){console.log(x+2)},
  f3: (x)=>{console.log(x+3)}
}

object.f(1)
object.f2(1)
object.f3(1)
```


个人最喜欢喜欢第一种写法，最简洁


## 三、对象


- 对象是一系列属性的集合
- 对象中的函数叫“方法”



```
let object = {name:'Eddie',age:18}
```


## 三、类


- 定义类和继承类



```
// 定义一个矩形类
class Reactangle{
	constructor(length,width){
  	this.length = length
    this.width = width
    this.name = "reactangle"
  }
  area(){
  	return this.length*this.width
  }
  perimeter(){
  	return (this.length + this.width)*2
  }
}

let reactangle = new Reactangle(3,4)
console.log(reactangle.name)  // reactangle
console.log(reactangle.area())  // 12
console.log(reactangle.perimeter())  // 14

// 定义一个正方形类，继承矩形类，并可以计算出以它的边长形成的立方体
class Square extends Reactangle{
	constructor(width){
  	super()
    this.length = width
    this.width = width
    this.name = "square"
  }
  volumn(){
  	return Math.pow(this.width,3)
  }
}

let square = new Square(5)
console.log(square.name)  // square
console.log(square.area())  // 25
console.log(square.perimeter())  // 20
console.log(square.volumn())  // 125
```


## 四、... 语法


- ... 扩展运算法能够把对象和数组拆分开



_参考博客：_[_ES6 扩展运算符_](https://blog.csdn.net/qq_30100043/article/details/53391308)

### 1. 数组中 ... 的使用


```
let array = [1,2,3,4,5]
console.log(...array)  // 1 2 3 4 5
console.log(0,...array,6)  // 0 1 2 3 4 5 6
```


### 2. 对象中 ... 的使用


```
let object = {name:'Eddie',age:18}
let object2 = {...object,hobby:'music'}
console.log(object2)  // {{name:'Eddie',age:18},hobby:'music'}
```


_「@浪里淘沙的小法师」_
