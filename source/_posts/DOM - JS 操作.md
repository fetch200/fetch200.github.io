---
title: DOM - JS 操作
date: 2020/5/1 18:00:00
categories: 基础知识
---

DOM 的相关知识，内容包括简介、获取网页元素、节点之增、节点之删、节点之改、节点之查。


## 一、简介


DOM 是 JavaScript 操作网页的接口，全称是“Document Object Model”。它的作用是将网页转为一个 JavaScript 对象，从而可以用脚本进行“增删改查”。浏览器根据 DOM 模型，将结构化文档解析成一系列的节点组成 DOM Tree。所有的节点和最终的树状结构，都有规范的对外接口。


DOM 只一个接口规范，它不是 JavaScript 语法的一部分，但是 DOM 操作是 JavaScript 最常见的任务，离开了 DOM，JavaScript 就无法控制网页了。


## 二、获取网页元素


假设 index.html 中 body 标签下有以下这两个标签


```
<div id = 'test1' class="testing">测试1</div>
<div id = 'test2' class="testing">测试2</div>
```


四种方式获取元素


```
test1 // id 直接获取元素
document.querySelector('#test1')  // 通过 id 获取元素
document.querySelector('.testing')  // 通过 class 获取元素
document.querySelectorAll('.testing')  // 通过 class 获取元素，得到有序序列
```


获取特定元素


```
document.documentElement  // 获取 html 元素
document.head  // 获取 head 元素
document.body  // 获取 body 元素
document.all  // 获取所有元素
window  // 获取窗口，不是获取元素
```


## 三、节点之增


创建元素，添加 id 属性，添加 class 属性，添加文本，将元素插入到网页


```
let div3 = document.createElement('div')
div3.setAttribute('id','test3')
div3.setAttribute('class','testing')
div3.textContent = '测试3'
let div2 = document.querySelector('#test2')
document.body.insertBefore(div3,div2.nextSibling)
```


## 四、节点之删


删除 id 属性，删除 class 属性，删除文本，将元素从网页中删除


```
div3.removeAttribute('id')
div3.removeAttribute('class')
div3.textContent = ''
div3.remove()
```


## 五、节点之改


修改 id 属性，修改 class 属性，修改 文本


```
div2.id = 'test22'
div2.className = 'testing22'
div2.classList.add('newTest')
div2.textContent = '测试22'
```


## 六、节点之查


查父节点，查子节点（全部、第一个、最后一个子节点），查同级节点（上一个、下一个同级节点）


```
let body = document.body
console.log(div2.parentNode)  // 查看父节点
console.log(body.children)  // 查看全部子节点（不包含文本节点）
console.log(body.firstChild)  // 查看第一个子节点（包含文本节点）
console.log(body.lastChild)  // 查看最后一个子节点（包含文本节点）
console.log(div2.previousSibling)  // 查看上一个同级节点（包含文本节点）
console.log(div2.nextSibling)  // 查看下一个同级节点（包含文本节点）
```


_「@浪里淘沙的小法师」_
