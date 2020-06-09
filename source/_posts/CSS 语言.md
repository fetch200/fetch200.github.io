---
title: CSS 语言
date: 2020/4/29 18:00:00
index_img: /img/basis.jpg
categories: 基础知识
---

CSS 的相关知识，内容包括初始化 CSS 代码、文本在 div 里居中、div 居中、让 div 占屏幕的 50%、CSS 选择器、CSS 动画、滚动栏。


_之前写过一篇有关 CSS 的总结 → _[_点击这里_](https://juejin.im/post/5e4f741fe51d452717262614#heading-0)


## 一、初始化 CSS 代码


```
*{margin:0;padding:0;box-sizing:border-box}
* ::before,* ::after{box-sizing:border-box}


ul,ol{list-style:none}
```


## 二、Div 宽高


不要把 div 的高高度写具体，一般写 max-height、min-height，具体高度让里面的内容去撑
## 
## 二、文本在 div 里居中


```
text-align:center  /*左右居中*/
```


- vertical-align 用于指定元素的垂直方向对齐方式
- line-height:100px 用于指定文字的行高



如果文字只有一行，把高度和行高设置成一样高，可以达到上下居中的效果


```
height: 24px
line-height:24px
```


## 三、div 居中


父元素使用 flex 布局即可


```
#module1{
    display:flex;
    justify-content:center;
    align-items:center;
}
```


父元素 flex 布局下，还可以调整子元素左右居中


```
#module1>.circle{
    margin-left:auto;
    margin-right:auto;
}
```


## 四、让 div 占屏幕的 50%


```
width:50vw;
height:50vh
```


## 五、CSS 选择器


选择元素通过以下三种方式


1. 标签名  // div
1. id     // #id-name
1. class  // .class-name



通过逗号、大于号、空格来对结果扩大筛选，缩小删选


```
/* 使用逗号、大于号时，中间可以忽略间隙*/
#module1,.module2{}  //选择两种
#module1>.button-list{}  // 一级子元素
.button-list button{}  // 内部所有
.a.b // 同时满足
```


## 六、CSS 动画


transform 属性配合 transition 做出简单的动画


- translate -- 位移
- scale -- 缩放
- rotate -- 旋转



```
#module3>.square{
    transition:transform 1s;
}
#module3>.active{
    transform: translateX(10vw) ;
}
```


animation 做动画更加高端一些，配合 transition 使用


```
@keyframes change {
   0%{
       background: red;
   }
   100%{
       background: blue;
   }
}
#module4>.active{
   animation: change 1s infinite alternate linear;
}
```


## 七、滚动栏


- 咦，flex 布局怎么宽度不够，哦，原来17像素是滚动条的宽度
- 14 ~ 19 像素大概是滚动条的宽度
- CSS 中隐藏滚动条可以可以做如下操作



```
overflow: hidden
```


_「@浪里淘沙的小法师」_
