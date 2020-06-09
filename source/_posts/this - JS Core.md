---
title: this - JS Core
date: 2020/4/30 19:00:00
index_img: /img/basis.jpg
categories: 基础知识
---

this 的相关知识，内容包括函数中的 this、类中的 this、博客参考。


## 一、函数中的 this


- this 是什么？一般是实例对象
- 怎么用？结合语境灵活运用



### 1. 普通函数与 this


```
function f(){
	return this
}
let object = {
	n:0
}

console.dir(f.call())  // window ———— Window 的实例
console.dir(f.call(object))  // object ———— Object 的实例
```


**记住这两条！！！**


- 函数只是函数，具体 this 是什么，要看传给它的 this 是什么
- 当传递的 this 为空时，this 默认指向 window



### 2. 箭头函数与 this


- 箭头函数里是没有 this 的，因为它不接受 this 参数，它油盐不进



```
let object2 = {
	n:0,
  f2:()=>{
  	return this
  },
  f3(){
  	return this
  }
}

console.log(object2.f2())  // window ———— Window 的实例
console.log(object2.f3())  // object2 ———— Object 的实例
```


**分析：**


- 在最外部，this 的指向为 window
- object2.f2() 时，object2 传给它新 this，f2() 油盐不进，因此 this 还是指向 window
- object2.f3() 时，object2 传给它新 this，f2() 接受了新 this，此时 this 指向 object2



### 3. 算清楚 this


this 是跟着函数的“语境”变化的，想要清楚 this 的指向一步一步推，用完整写法 .bind()，把函数传参搞清楚，这样一定能搞定。


### 4. 箭头函数与 this 配合


1. ()=>{f()}
1. f



方式一和方式二直接或间接调用函数 f，当满足以下条件时，使用方式一更好


- 这个函数是给外部调用的
- f 函数里面用到了 this



原因是当外部函数调用函数时会传入一个 this，如果 f 函数里面有 this，会把里面的旧 this 换成 新 this


- 普通函数会接受 this 参数，改变 this 指向
- 箭头函数不接受 this 参数，外部函数传给它的 this，它假装没看见



## 二、类中的 this


### 1. 定义一个类


- 定义类的时候，里面必须要写一个「构造函数」—— constructor
- 构造函数中的 this 指向类的「实例」
- 我们在构造函数里把属性挂到创建的「实例」上面



```
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
console.dir(reactangle)
```


![image.png](https://cdn.nlark.com/yuque/0/2020/png/916537/1588151560837-a696670b-de0c-4e00-af31-5f1f6e270a6f.png#align=left&display=inline&height=183&margin=%5Bobject%20Object%5D&name=image.png&originHeight=187&originWidth=477&size=9523&status=done&style=none&width=467)


- new 命令的作用是执行构造函数，并返回一个实例对象
- 在构造函数外部的函数就是类的「方法」，它没有挂在实例上



### 2. 类中的函数


把「方法」挂在实例上也是可以的，把函数写在「构造函数」里


```
class Reactangle{
  constructor(length,width){
    this.length = length
    this.width = width
    this.name = "reactangle"
    this.area = ()=>{
    	return this.length*this.width
    }
    this.perimeter = ()=>{
    	return (this.length + this.width)*2
    }
  }
}

let reactangle = new Reactangle(3,4)
console.dir(reactangle)
```


![image.png](https://cdn.nlark.com/yuque/0/2020/png/916537/1588151678992-32888baa-d4ef-48e2-9524-1001290450e6.png#align=left&display=inline&height=199&margin=%5Bobject%20Object%5D&name=image.png&originHeight=185&originWidth=438&size=8763&status=done&style=none&width=471)


### 3. 另一种函数写法


把函数写到构造函数外部，但是能够把它挂到「实例」上


```
class Reactangle{
  constructor(length,width){
    this.length = length
    this.width = width
    this.name = "reactangle"
  }
	area = ()=>{
		return this.length*this.width
  }
  perimeter = ()=>{
    return (this.length + this.width)*2
  }
}

let reactangle = new Reactangle(3,4)
console.dir(reactangle)
```


## 三、 博客参考


_《JavaScript 的 this 原理》—— 阮一峰：_[_点击这里_](https://www.ruanyifeng.com/blog/2018/06/javascript-this.html)
_《this 的值到底是什么》—— 方应杭：_[_点击这里_](https://zhuanlan.zhihu.com/p/23804247)
_
_「@浪里淘沙的小法师」_
