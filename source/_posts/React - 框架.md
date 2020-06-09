---
title: React - 框架
date: 2020/5/4 21:00:00
index_img: /img/basis.jpg
categories: 基础知识
---

React 的相关知识，内容包括简介、创建一个 React 项目、React 组件、props、state、事件绑定、Class 组件、函数组件。


## 一、简介


React 是一个用于创建用户界面的开源 JavaScript 框架
_
_中文官网：React.js → _[_点击这里_](https://zh-hans.reactjs.org/)_ _


### 1. 简单类比


> Webpack 就像一个没有装修过的“毛坯房”，提供了一个基本的“房子”，满足遮风挡雨的需求，不能直接满足睡觉、写字等需求。
> 

> - 想睡觉，自己添加床
> - 想写字，自己添加桌子
> _> Vue 就像“中国风”的精装修，床、桌子等已经都帮我们搞定，不用自己添加。
> 

> - 如果需求不满足，也可以自己在上面增增减减做改动
> - 因为 Vue 就是基于 Webpack 开发的



如果把 Webpack 比喻成一个没有装修过的“毛坯房”，把 Vue 比喻成“中国风”的精装修，那么 React 就是“欧美风”的精装修，基本需求帮我们搞定，自己可以在上面增增减减做改动。


## 二、创建一个 React 项目


### 1. CDN 引入 React


- script 标签引入 「React」和「React DOM」



```
<script src="https://cdn.bootcss.com/react/16.10.2/umd/react.development.js"></script>
<script src="https://cdn.bootcss.com/react-dom/16.10.2/umd/react-dom.development.js"></script>
```


### 2. React CLI 创建项目


- 我们可以直接在 JS 里使用 JSX 语法
- 因为 babel-loader 内置了 jsx-loader



```
yarn global add create-react-app
create-react-app react-demo-1

cd react-demo-1
yarn start
```


## 三、React 组件


### 1. 基本公式


React 的风格是“在 JS 里写标签”，它的基本公式如下，创建一个虚拟 DOM

- React.createElement('div', ClassName="greet",Hello)



1. 参数一接受字符串 / 类 / 函数
1. 参数二写属性的 key 和 Value
1. 参数三写文本内容



React 的 babal-loader 能够让我们写 HTML 风格，然后转译成虚拟 DOM 形式


该网站可以让我们看到转译前后对比，帮助理解：[_babel online_](https://babeljs.io/repl#?browsers=&build=&builtIns=false&spec=false&loose=false&code_lz=Q&debug=false&forceAllTransforms=false&shippedProposals=false&circleciRepo=&evaluate=false&fileSize=false&timeTravel=false&sourceType=module&lineWrap=true&presets=es2015%2Creact%2Cstage-2&prettier=false&targets=&version=7.9.6&externalPlugins=)


```
<div className="red" title="name">Hello</div>

React.createElement("div", {
  className: "red",
  title: "name"
}, "Hello");
```


- 参数一传入字符串，得到元素
- 参数一传入类，React 会构造出一个实例，调用 render 方法，获取其返回值
- 参数一传入函数，React 会调用这个函数，获取其返回值



### 2. 使用组件


```
function App(){
	return (<div className="App">
  	<Test />
  </div>)
}
ReactDom.render(App(),querySelector('#root'))
```


### 3. 类组件


```
class Test extends React.Component{
	constructor(){
  	super()
    this.state = {n:100}
  }
  add(){
  	this.setState({n:this.state.n+1})
  }
	render(){
		return (<div className="test">
    n:{this.state.n}
    <button onClick={()=>this.add()}>+1</button>
    </div>)
  }
}
```


### 4. 函数组件


```
let Test2 = () => {
  let [n, setN] = React.useState(100)
  return (<div className="test2">
		n:{n}
    <button onClick={() => setN(n + 1)}>+1</button>
  </div>)
}
```


### 5. 组件的特点


**类组件中**


- 直接修改 state.n 不会更新到 UI，需要使用 setState() 异步更新 UI
- setState(this.state) 不被推荐，React 希望我们不要修改旧的 state，不可变数据
- 这是函数式理念



**函数组件中**


- 通过 setX 改变数据，它永远不改变旧 state，它产生新 state
- 没有 this，一律使用参数和变量



## 四、props


- 类比 Vue 中的 props



React 中，你可以传字符串，也可以传表达式


- 传字符串，用 "" 括起来
- 传表达式，用 {} 括起来



### 1. 类组件 props


- 通过 this.props.message 可以拿到父元素传的参数



```
// 父元素传参给 Test
<Test message="Hello" />

// 子元素直接使用参数
<div>父元素给我传的参数是：{this.props.message}</div>
```


### 2. 函数组件 props


- 通过 props.messge2 可以拿到父元素传的参数



```
// 父元素传参给 Test2
let age = 20
<Test2 message2={`你今年${20}岁了`}>

// 子元素通过函数接收参数并使用
let Test2 = (props){
	return (
  	<div>父元素传给我的参数是：{props.message2}</div>
  )
}
```


## 五、state


- 类比 Vue 中的 data



### 1. 类组件 state


- 初始化数据，this.state = {n: 100}
- 读数据，{this.state.n}
- 改数据，add(){ this.setState( { n: this.state.n + 1 } ) }
   - 不能直接 this.setState.n +=1
   - 因为 React 不会一直监听数据对象的变化



React 希望改变数据之后，传一个新的数据对象，它不推荐「在原有 state 修改，再传这个 state」


- React 理念是：数据是不可变的



setState 是一个异步的更新 UI 过程，为了不混淆旧 state 和新 state，更加推荐在 setState 里面传函数


```
add = ()=>{
	setState((state)=>({x: state.x + 1}))
}
```


### 2. 函数组件 state


- 使用 useState 返回数组
- 第一项用于读数据
- 第二项用于写数据



```
let [n,setN] = useState(100)
// n 用于读，setN 用于写
```


- setN 永远不会改变 n，它会产生一个新的 n
- 这和 this.setState 不同，this.setState 会等一会改变 n



### 3. 复杂 state


类组件中，对 state 的部分数据修改，其他数据它会自动沿用上次的值


- 类组件 setState 会自动合并第一层属性，不会合并第二层属性
- 熟练运用 ...



```
...this.state
Object.assign()
```


函数组件中，对 state 部分修改，其他数据不会沿用上次的值


- 函数组件 setState 不会自动合并
- 熟练运用 ...



```
// 推荐使用如下方式
let [m,setM] = useState(100)
let [n,setN] = useState(100)

// 如果想使用 state 对象的形式，自己主动复制一份
let [state,setState] = useState({m:100,n:100})

...state
```


## 六、事件绑定


### 1. 类组件的事件绑定


- ()=>fn() 的写法是最安全的，当外部调用该函数传入 this 时，函数 fn 如果里面使用 this，则不会改变其 this 的指向



```
<button onClick={()=>fn()}>+1</button>
```


### 2. 事件绑定终极写法


- fn 写成箭头函数，取消中间转换的过程
- 以下写法中，add 函数 写在 constructor 外面，也能添加到实例上



```
class Test extends React.Component{
	constructor(){
  	super()
  }
	add = ()=>{this.setState({n: this.state.n + 1})}
}

<button onClick={add}>+1</button>
```


## 七、Class 组件


### 1. 创建 Class 组件


- 使用 ES6 方式创建组件更好



**ES5 方式（已过时）**


```
import React from 'react'

const App = React.createComponent(
	render(){
  	return (<div>Hello</div>)
  }
)
```


**ES6 方式**


```
import React from 'react'

class App extends React.Component{
	constructor(props){
  	super(props)
  }
  render(){
  	return (<div>Hello</div>)
  }
}
```


### 2. props


- 传 props：父组件中，<App2 data={this.state.n} func={this.func}>Hello</App>
   - 父组件传数据时，props 被包装成一个对象，{n:100, func:..., children: Hello}
   - func 是一个回调
- 读 props：子组件中，this.xxx
- 写 props，不要修改 props 的值
   - 这是一个理念，既然是外部传进来的数据，那就由外部修改



```
// 父组件
class App extends React.Component{
	constructor(){
  	super()
    this.state={n:100}
  }
  func=()=>{}
  render(){
  	return (
    	<App2 data={this.state.n} func={this.func}>Hello</App>
    )
  }
}

// 子组件
class App2 extends React.Component{
	constructor(props){
  	super(props)
    render(){
    	return (
      <div onClick={this.props.func}>  // func 函数
      <div>{this.props.n}</div>  // 100
      <div>{this.props.children}</div>  // Hello
      </div>
      )
    }
  }
}

```


componentWillReceiveProps（已经弃用）


这是一个生命周期钩子，在 props 变化时触发，现已更名为 UNSAFE_componentWillReceiveProps

```
componentWillReceiveProps(newProps,newContext){
	console.log(this.props)  // 旧的 props
  console.log(newProps)  // 新的 props
}
```


### 3. state


- 创建 state：在 constructor 函数中，this.state = xxx
- 读 state：this.state
- 写 state：this.setState({n:100})
   - 它是异步更新 UI 的
   - this.setState(state=>({n: state.n+1}))，这种写法能够更方便理解 state 的值
   - setState 函数还可以接收一个函数参数 fn，在写 state 成功后运行
   - 写 state 会 shallow merge，会自动将新、旧 state 进行一级合并
   - 不推荐直接在旧 state 直接修改值，虽然这是可行的



使用 React.PureComponent 会在 render 之前把新 props、state 和旧 props、state 做比较，只比较第一层，如果有变化，则会 render


### 4. constructor


- 初始化 props 和 state



### 5. shouldComponentUpdate


- 返回 true，UI 更新
- 返回 false，阻止 UI 更新



它允许我们手动判断是否要进行组件更新，我们可以根据应用场景灵活设置返回值，以避免不必要的更新


React 有一个功能自动判断 UI 更新，名字叫 React.PureComponent，可以代替 React.Component


- 同样，它只判断第一层



### 6. render


- 展示视图 return (<div>...<div>)，只能有一个根元素
- 如果有两个根元素，则外部再套一个 React.Fragment 标签，可简写成 <></>



render 可以写 if...else，?: 表达式，不能直接写 for 循环，需要用数组，可以写 array.map（循环）


### 7. componentDidMount


- 在元素插入页面后执行代码，这些代码依赖 DOM
- 此处可以写发起加载数据的 AJAX 请求
- 首次渲染会执行此钩子



### 8. componentDidUpdate


- 在视图更新后执行代码
- 此处也可以发起 AJAX 请求，用于更新数据
- 首次渲染不会执行此钩子



### 9. componentWillUnmount


- 组件将要被移除页面然后被销毁时执行代码
- unmount 过的组件不会再次 mount



## 八、函数组件


- 函数组件能完全代替 Class 组件
- useState 解决 state
- useEffect 解决 lifecycle
- 它还有一些 Hooks
- 它可以自定义钩子满足需求



### 1. 创建函数组件


```
// 常用方式
const App = (props)=>{
	return <div>props.message</div>
}

// 省略 () 和 return
const App2 = props => <div>props.message</div>

// 使用普通函数
function App3(props){
	return <div>props.message</div>
}

```


### 2. useEffect


**模拟 componentDidMount**


- 第二个参数是空数组



```
useEffect(()={console.log('第一次渲染')},[])
```


**模拟 componentDidUpdate**


- 任意数据变化时触发，第二个参数省略
- 部分数据变化时触发，第二个参数写成包含数据的数组



```
useEffect(()=>{console.log('任意数据变了')})
useEffect(()=>{console.log('n 或 m 变化了')},[m,n])
```


该用法在数据第一次渲染时也会触发，如果不想第一次触发，可以自己写一个 useUpdate 钩子满足需求


**模拟 componentWillUnmount**


- 函数里面套一个函数



```
useEffect(()=>{
	console.log('第一次渲染')
  return ()=>{
  	console.log('组件要消亡了')
  }
})
```


_「@浪里淘沙的小法师」_
