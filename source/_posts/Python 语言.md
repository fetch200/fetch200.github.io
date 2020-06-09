---
title: Python 语言
date: 2020/4/26 20:00:00
index_img: /img/basis.jpg
categories: 基础知识
---

Python 语言的相关知识，内容包括数据类型、函数、对象、类。


## 一、数据类型


Python 数据类型可以分成两大类，基本类型和容器类型


- 基本类型：整数、浮点数、复数、字符串、逻辑值



```
number = 1
number2 = 2.2
number3 = 3+3j
string = 'Hello'
t = True / False

type(number)  # <class 'int'>
```


- 容器类型：列表、元组、字典、集合



```
list1 = [1,2,3,4,5] 
tuple1 = (2,3,4,5,6)
dict1 = {'a':1, 'b':2, 'c':3}
set1 = {1,3,4,6,8}
```


**一些数学运算**
**
```
5/2  # 2.5，这是完整的除法，得到完整的商
5//2  # 2，得到商的整数部分
5%2  # 1，得到余数
divmod(5,2)  # (2,1)，得到一个元组，分别是商的整数部分和余数
2**3  # 8，2 的 3 次方
abs(-3)  # 3，求绝对值
7 > 3 >=4  # True，连续判断
```


**一些逻辑值判断**


- 对于整数、浮点数和复数类型，0是“假”，所有非0的数值都是“真”
- 对于字符串类型，空串("")是“假”，所有非空串都是“真”
- 所有序列类型（包括字符串），空序列是“假”，所有非空的序列都是“真”
- 空值None表示“无意义”或“不知道”，也是“假”



## 二、函数


在命名变量的时，我被“坑”了一波，不能直接使用 list、set、dict，因为这几个名字在 Python 已经是函数名了

- 与 JavaScript 不同，JavaScript 可以直接使用 array，object 等，因为它的函数名是大写
- 这里以后我要注意了，在变量名加一个后面接一个数字



```
// 普通函数
def f(a,b):
	return a+2*b

f(1,2)  # 5

// 匿名函数
f = lambda a,b:2*a+b

f(2,3)  # 7
```


**map() 函数**


- Python 3.x 中，map() 返回一个迭代器，从前 Python 2.x 中是返回一个列表



```
list1 = [1,2,3,4,5]
f = lambda x:x**2

list(map(f,list1))  # [1,4,9,16,25]
```


## 三、对象


- Python 中的所有事物都是以对象形式存在，从简单的数值类型，到复杂的代码模块，都是对象
- 对象以 id 作为标识，既包含数据(属性)，也包含代码(方法)，是某一类具体事物的特殊实例



```
# 查看 id
id(1)  # 140714626041504

# 查看属性和方法
dir(1)
```


## 四、类


```
# 定义一个矩形类
class Reactangle:
	def __init__(self,length,width):
  	self.length = length
    self.width = width
    self.name = "Name: reactangle"
  def area(self):
 		return self.length*self.width
  def perimeter(self):
 		return (self.length+self.width)*2

reactangle = Reactangle(3,4)
print(reactangle.area())  // 12
print(reactanle.perimeter())  // 14

# 定义一个正方形类，继承矩形类，额外可以计算出以它的边长形成的立方体体积
class Square(Reactangle):
	def __init__(self,width):
  	self.length = width
  	self.width = width
    self.name = "Name: square"
  def volumn(self):
  	return pow(self.width,3)
 
 square = Square(5)
 print(square.area())  // 25
 print(square.perimeter())  // 20
 print(square.volumn())  // 125
```


_「@浪里淘沙的小法师」_
