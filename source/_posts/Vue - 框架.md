---
title: Vue - 框架
date: 2020/5/4 20:00:00
categories: 基础知识
---

Vue 的相关知识，内容包括简介、创建一个 Vue 项目、Vue 的使用、Vue 实例和选项、Data、DOM、Lifecycle Hooks、Assets、Composition、Misc。


## 一、简介


Vue 是一个用于创建用户界面的开源 JavaScript 框架_

_中文官网：Vue.js → [点击这里](https://cn.vuejs.org/index.html)_

_中文官网：Vue CLI → [点击这里](https://cli.vuejs.org/zh/)_


Vue.js 是 Vue 的使用教程，Vue CLI 是 Vue 的命令行工具


### 1. 简单类比


> Webpack 就像一个没有装修过的“毛坯房”，提供了一个基本的“房子”，满足遮风挡雨的需求，不能直接满足睡觉、写字等需求。
> 

> - 想睡觉，自己添加床
> - 想写字，自己添加桌子


如果把 Webpack 比喻成一个没有装修过的“毛坯房”，那么 Vue 就是“中国风”的精装修，床、桌子等已经都帮我们搞定，不用自己添加。


- 如果需求不满足，也可以自己在上面增增减减做改动
- 因为 Vue 就是基于 Webpack 开发的



## 二、创建一个 Vue 项目


Vue 有两个版本，「完整版」和「不完整版」，「不完整体积」比「完整版体积」小 30% 左右。


「完整版」多出来的代码是编译相关的，能够编译出我们在 JS 中写的的 HTML 代码。

### 1. CDN 引入 Vue


- script 标签引入「Vue完整版」/「Vue不完整版」



```
<srcipt src="https://cdn.bootcss.com/vue/2.6.11/vue.min.js"></script>
```
```
<script src="https://cdn.bootcss.com/vue/2.6.11/vue.runtime.min.js"></script>
```


### 2. 使用 Vue CLI 创建 Vue 项目


- 这里默认使用的是「Vue 不完整版」
- 通过使用 vue-loader 体验完整版功能



```
yarn global add @vue/cli
vue create vue-demo-1

cd vue-demo-1
yarn serve
```


## 三、Vue 的使用


当使用「不完整版」时，有一个方法办法能够体验「完整版」的功能，就是使用 Webpack 模块化的思想。


- 通过使用 vue-loader 引入 vue 文件
- vue-loader 可以把 vue 文件编译成 JS



### 1. main.js


创建一个 Vue 实例，渲染 App.vue 到 id 为 app 的标签


```
import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
```


### 2. App.vue


三部分内容：template 标签、script 标签、style 标签


- template 标签里面写 HTML，使用 XML 语法
- script 标签里面写 JS
- style 标签里面写 CSS



App.vue 中


```
<template>
</template>

<script>
</script>

<style lang="scss">
</style>
```


## 四、Vue 实例和选项


```
let vm = new Vue(options)
```


- 以上语句创造了一个 Vue 的实例 vm，它接受 options 参数
- vm 封装了对视图的所有操作，包括数据读写、事件绑定、DOM 更新
- options 称之为选项，选项分成六类



   1. 数据：→ [_点击这里_](https://cn.vuejs.org/v2/api/#%E9%80%89%E9%A1%B9-%E6%95%B0%E6%8D%AE)
   1. DOM：→ [_点击这里_](https://cn.vuejs.org/v2/api/#%E9%80%89%E9%A1%B9-DOM)
   1. 生命周期钩子：→ [_点击这里_](https://cn.vuejs.org/v2/api/#%E9%80%89%E9%A1%B9-%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F%E9%92%A9%E5%AD%90)
   1. 资源：→ [_点击这里_](https://cn.vuejs.org/v2/api/#%E9%80%89%E9%A1%B9-%E8%B5%84%E6%BA%90)
   1. 组合：→ [_点击这里_](https://cn.vuejs.org/v2/api/#%E9%80%89%E9%A1%B9-%E7%BB%84%E5%90%88)
   1. 其他：→ [_点击这里_](https://cn.vuejs.org/v2/api/#%E9%80%89%E9%A1%B9-%E5%85%B6%E5%AE%83)



- 中文、英文对照着看，这岂不是又一个学习英语的好时机[🤞](https://emojipedia.org/crossed-fingers/)


## 五、Options / Data


data、props、propsData、computed、metheds、watch


### 1. data、methods


- data 支持对象和函数，实例中可以写对象和函数，组件中必须使用函数
- data 使用函数，返回一个对象
- metheds 支持事件处理函数和普通函数



Vue.vue 中


```
<template>
  <div id="app">
    <div>{{n}}</div>
    <button v-on:click="add()">+1</button>
    <div>{{filter()}}</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      n: 100,
      array: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    };
  },
  methods: {
    add() {
      this.n += 1;
    },
    filter() {
    	console.log("执行了一次 filter 函数")
      return this.array.filter(i => i % 2 === 0);
    }
  },
};
</script>
```


### 2. 直接、间接获取数据


- 假设已知 a 的值，现在要获取 a+1 的值
- 通过表达式和函数两种方式获取



```
a = 1

b = a + 1
c = function(){return a+1}

console.log(`b:${b},c:${c()}`)
```
打印结果：b:2,c:2


- 表达式方式是及时的，函数方式延迟性的
- 函数方式的延迟有个优点，数据之间不会混淆



假设去修改表达式和函数，现在要获取 a+2 的值，原来的 b、c 复制一份给 b2、c2


```
b2 = b
c2 = c

b = a + 2
c = function(){return a+2}

console.log(`b:${b},c:${c()}`)
// b:3,c:3
```
```
console.log(`b2:${b},c2:${c2()}`)
// b2:3,c2:2
```


可以看到，原来复制而来的 b2 变了，c2 没变，这就是函数方式的优点


其实表达式复制是可以的，复制 a+1 即可，当表达式很复杂呢？复制同样也就很复杂，而函数不同，直接变量赋值搞定


### 3. props


Vue.vue 中


```
<template>
	{{message}}
	<button @click="fn">call fn</button>
</template>

export default = {
	prop:['message','fn']
}
```
```
<Vue message="Hello">  // 这是传字符串

// 如果要传实例上的内容呢？ this.n - 数据、this.add - 函数
<Vue :message="n" :fn="add />
```


### 4. computed


- computed 是计算属性，可以对 data 属性中的值做计算生成一个新的属性
- 如果给它一个函数，这个函数默认是 getter
- 也可以自己设置 setter，给它一个对象，address: {getter(), setter()}



```
<template>
  <div id="app">
    <div>{{user}}</div>
    <div>{{address}}</div>
  </div>
</template>

export default {
  data() {
    return {
      user: {
        name: "小白",
        cellphone: "1383838438",
        email: "xiaobai.qq.com"
      }
    };
  },
  computed: {
    address() {
      let {user} = this;
      return `姓名：${user.name}，电话：${user.cellphone}，邮箱：${user.email}`;
    }
  }
}
```


computed 里面写的是一个方法，在页面中直接把这个方法，它会自动读取这个函数的返回值。


### 5. watch


- 监听 data 中的数据，当有变化时，执行一个函数
- watch 里面是接收一个函数，传入两个参数，新数据和旧数据
- watch 是异步的
- watch 里面也可以接收一个对象，对象里面两个函数
   - hander()  // 函数内容和上面的一样
   - immediate: true  // 意思是第一次渲染的时候也运行一下函数
- watch 监听简单数据类型，数据变了就一定变了
- watch 监听对象的地址，当对象内部内容发成变化，watch 无法监听到
   - 想要监听对象内部，再添加一个属性
   - deep: true
- 还可以使用全局 API 的方式监听数据，可以把放到生命周期钩子里
   - vm.$watch()



_watch 完整用法（官方文档）：_[_点击这里_](https://cn.vuejs.org/v2/api/#watch)


```
export default {
  data() {
    return {
      n: 100,
      array: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    };
  },
  watch: {
  	n(newValue,oldValue){console.log(`from ${oldValue} to ${newValue}`)}
  }
}
```


### 6. computed 和 watch 的区别


computed 是计算属性的意思，watch 是监听的意思。


computed 是用来计算出一个值的，这个值不需要加括号，调用的时候不需要加括号，根据依赖会自动缓存，如果依赖不变，它不会重新计算。


watch 是如果某个属性变化了，去执行一个函数。它有两个选项，immediate 表示是否要在第一次执行渲染这个函数，deep 意思是监听一个对象，是否要看对象里面的属性的变化。


## 六、DOM


el、template、render、renderError


### 1. el


- 提供一个在页面上已存在的 DOM 元素作为 Vue 实例的挂载目标
- 与 $mount() 有替换关系



main.js 中
```
// 方式一
new Vue({
  el: '#app',
  render: h => h(App),
})

// 方式二
new Vue({
  el: '#app',
  render: h => h(App),
}).$mount('#app')
```


### 2. template


vue 文件中 template 标签的的一些语法


- 使用 XML 语法（不是 HTML）
- 使用两个大括号插入表达式
- 使用 v-html、v-on、v-bind 等指令操作 DOM
- 使用 v-if、v-for 等指令实现条件判断和循环



**展示内容**
```
<template>
	{{object.a}}
  {{n+1}}
  {{fn}}
  
  <div v-text="表达式"></div>
  <div v-html='x'></div>
  <div v-pre>{{n}}</div>
</template>
```


**绑定属性**
```
<template>
	<img v-bind:src="x" />
  <img :src="y" />
  <div :style="{border:1px solid red}"></div>
</template>
```


**绑定事件**
```
<template>
	<button v-on:click="add">+1</button>
  <button @click="add()">+1</button>
  <button @click="n+1">+1</button>
</template>
```


**条件判断**
```
<template>
	<div v-if="x>0">
  显示 x > 0
  </div>
	<div v-else-if="<0">
  显示 x = 0
  </div>
	<div v-else>
  显示 x = 0
  </div>
</template>
```


**循环**
```
<template>
	<ul>
  <li v-for="(value, name) in obj" :key="name">
    属性名：{{name}}  属性值：{{value}}
  </li>
</ul>
</template>
```


显示和隐藏
```
<template>
	<div v-show="n%2 === 0">n 是偶数</div>
</template>
```
## 七、Lifecycle Hooks


beforeCreate、created、beforeMount、mounted、beforeUpdate、updated、activeated、deactivated、beforeDestroy、destroyed、errorCaptured


### 1. created、mounted


```
created() {
	console.log("已创建到内存中");
},
mounted() {
	console.log("已挂载到页面中");
}
```


### 2. updated、destroyed


```

updated(){
	console.log("已更新")
},
destroyed(){
	console.log("已消亡")
}
```
## 八、Assets


directives、filters、components


### 1. directives


_官方中文文档：→ _[_点击这里_](https://cn.vuejs.org/v2/api/#%E6%8C%87%E4%BB%A4)


- 内置指令： v-text、v-html、v-show、v-if、v-else、v-else-if、v-for、v-on、v-bind
- 内置指令：v-model、v-slot、 v-pre、v-cloak、v-once
- Vue 允许使用自定义指令，对普通 DOM 元素进行底层操作，实现代码复用和抽象
- 减少 DOM 操作的重复



```
// 全局使用
Vue.directive('greet',{
	inserted(el){
  	el.addEventListener('click',()=>console.log('Hello'))
  }
})

// 局部使用
directives: {
	greet2: {
  	inserted(el){
    	el.addEventListener('click',()=>console.log('Hello2'))
    }
  }
}
```


直接将指令添加到标签上，即可使用该指令


```
<div v-x>Hello</div>
```


_详细用法：_[_点击这里_](https://cn.vuejs.org/v2/guide/custom-directive.html#%E9%92%A9%E5%AD%90%E5%87%BD%E6%95%B0)
_
### 2. modifer


_按键修饰符的文档：_[_点击这里_](https://cn.vuejs.org/v2/guide/events.html#%E6%8C%89%E9%94%AE%E4%BF%AE%E9%A5%B0%E7%AC%A6)


- 指令可以加修饰符
- [@click.stop、@click.prevent、@click.stop.prevent](#)



### 3. .sync 修饰符


- 一块语法糖



Vue 的规则中


- 组件不能修改 props 外部数据
- this.$emit 可以触发事件并传参
- this.$event 可以获取 $emit 的参数



_官方中文文档：_[_点击这里_](https://cn.vuejs.org/v2/guide/components-custom-events.html#sync-%E4%BF%AE%E9%A5%B0%E7%AC%A6)


### 3. components


main.js 中
```
// 引入一个组件，方式一
import Vue from 'Vue.vue'

// JS 方式做一个组件
Vue.component(<组件名>,{
	template:`<页面内容>`
})


// 使用组件
new Vue({
	components: {
		<组件名>: <组件>
    template:`<组件名>`
	}
})
```


## 九、Composititon


parent、mixins、extends、provide、inject


### 1. mixins


- 减少 data、methods、钩子的重复
- 它很聪明，会自动合并
- log 必须是对象



### 2. extends


- Vue 继承扩展
- 和 mixins 很像
- const vue2 = Vue.extend()



### 3. provide 和 inject


- 给子代共享数据，并能够修改



## 十、Misc


name、delimiters、functional、model、inheritAttrs、comments

_「@浪里淘沙的小法师」_






