---
title: Webpack - 打包工具
date: 2020/5/4 19:00:00
index_img: /img/basis.jpg
categories: 基础知识
---

Webpack 的相关知识，内容包括简介、安装 Webpack、Webpack 基本配置、Webpack 进阶配置、Webpack 配置汇总、预览。


## 一、 简介


Webpack 是一个模块打包工具


_官网：→ _[_点击这里_](https://webpack.docschina.org/)
_
### 1. 简单类比
_
Webpack 就像一个没有装修过的“毛坯房”，提供了一个基本的“房子”，满足遮风挡雨的需求，不能直接满足睡觉、写字等需求。


- 想睡觉，自己添加床
- 想写字，自己添加桌子



Webpack 内置 babel-loader，能够加载 JS，不能直接加载 HTML、CSS等其他内容。想要有其他需求，通过「loader」和「plugin」做相关配置。


- 引入 JS，内置 babel-loader，直接引入
- 预览 HTML ，配置 html-webpack-plugin、webpack-dev-server
- 引入 CSS，配置 stype-loader、css-loader、mini-css-extract-plugin
- 引入 SCSS，配置 sass-loader、data-sass
- 引入 LESS，配置 less-loader、less
- 引入 Stylus，配置 stylus-loader、stylus
- 引入图片，配置 file-loader

_
## 二、安装 Webpack


### 1. 初始化目录


参数 -y：使用默认初始化
```
npm init -y
```


### 2. 安装两个包


需要安装两个包，webpack 和 webpack-cli，前者是 webpack，后者是 webpack 命令行工具。


参数 --dev：将包版本添加到 dev 依赖
```
yarn add webpack webpack-cli --dev
```


### 3. 三个目录


在本地项目初始化并安装完 Wepack 后，有 3 个目录


1. **node_modules** 是安装 node 后用来存放用包管理工具下载安装的包的文件夹
1. **package.json **包含关于项目的元数据，包括项目名称和说明、程序包版本号和程序所需的依赖列表
1. **yarn.lock **存储比 package.json 中的依赖列表的更详细信息



webpack 命令可以进行对我们做的项目进行打包，它位于 node_modules/.bin/webpack


```
// 以下两种方式均可运行
.node_modules/.bin/webpack
npx webpack
```


## 三、Webpack 基本配置


当我们直接运行 webpack 命令的时候，会报错，这是无法成功的。


Webpack 是打包工具，我们当然要提前给 Webpack 设置好打包的规则和打包的内容。


怎么配置？去官网“复制、粘贴”走起。


### 1. 创建一个配置文件


在根目录创建 webpack.config.js，里面的代码就是打包规则


```
const path = require('path');

module.exports = {
 	entry: './src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist')
  }
};
```


- entry：入口
- output：出口
   - filename：文件名
   - path：路径



打包时运以下命令，其中 config 参数用于指定打包配置，若不写，则默认 webpack.config.js


```
npx webpack --config webpack.config.js
```


### 2. 创建一个 src 目录


在根目录创建 src 目录，里面的文件就是打包内容，我们在里面写一个 index.js 吧


```
console.log("Hello")
```


### 3. 添加一个快捷方式


考虑到用 CLI 这种方式来运行本地的 webpack 并不是特别方便，我们可以设置一个快捷方式来运行

```
"scripts": {
	"build": "webpack"
}
```


### 4. 测试一下


运行 webpack 命令，会生成一个 dist 目录，里面就是打包后的文件。


```
yarn build
```


## 四、Webpack 进阶配置


### 1. mode、hash、build


**设置 mode**


Webpack 开发有两种模式，开发模式和生产模式，它们的区别在于开发模式中生成的 HTML 有注释、有段落，生产模式生成的 HTML 去除了段落和注释，体积更小。


- 开发预览时，使用开发模式 mode:  'development'
- 打包时，使用生产模式 mode: 'production'



```
modules.exports = {
	mode: 'none' / 'development' / 'production'
}
```


**添加 hash**

对于静态页面，我们都希望浏览器能够进行缓存，那样以后进入页面就可以直接使用缓存资源，这里利用 hash 方式修改文件名，以达到缓存目的。


```
modules.export = {
	output: {
  	filename: main.[contentHash].js
  }
}
```


**配置 build**

因为使用了给文件添加了 hash，每次生成新的文件，老的文件需要我们手动删除，所以这里重新配置 build。
```
"scripts":{
	"build": "rm -rf dist && webpack"
}
```


### 2. 引入 JS


Webpack 内置了 babel-loader，所以可以直接引用，无需任何配置。
```
import "./main.js"
```


main.js 中
```
console.log('Hi')
```


### 3. 引入 HTML


**安装 html-webpack-plugin、webpack-dev-server**


- html-webpack-plugin 可以自动生成 HTML
- webpack-dev-server 可以响应式预览 HTML，文件都保存在内存中，使开发变得又快又方便


```
yarn add html-webpack-plugin webpack-dev-server --dev
```


**配置 html-webpack-plugin，添加 HTML 模板**


```
const HtmlWebpackPlugin = require('html-webpack-plugin');
modules.export = {
	plugins:[
  	new HtmlWebpackPlugin({
    	title: 'Hello'，
      template: './src/assets/index.html'
    })
  ]
}
```
```
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title><%= htmlWebpackPlugin.options.title %></title>
</head>

<body>
    <div id="app1">Hi</div>
    div
</body>

</html>
```


**HTML 预览**

直接运行以下命令即可
```
webpack-dev-server
```


干脆直接把它添加到快捷方式里面，那样预览起来方便多了
```
scripts:{
	"serve": webpack-dev-server
}
```


### 4. 引入 CSS


引入 CSS 的方式有两种，一种方式是将 CSS 文件打包成 style 标签添加到 HTML 里，另一种方式是将 CSS 抽离成文件。


**方式一：style 标签的形式**


- css-loader 把 CSS 转译成 JS 字符串
- style-loader 把转译后的 CSS 转译成 style 标签添加到 HTML中



```
yarn add css-loader style-loader --dev
```
```
module.exports = {
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: ['style-loader', 'css-loader'],
      },
    ],
  },
};
```


main.js 中
```
import './style.css'
```


style.css 中
```
#app1{
    color: red;
    font-size: 40px;
}
```


**方式二：抽离成 CSS 文件**


- mini-css-extract-plugin 把 CSS 抽离成文件
```
yarn add mini-css-extract-plugin --dev
```
```
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  plugins: [new MiniCssExtractPlugin({
  	filename: style.[hashContent].css
  })],
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: [MiniCssExtractPlugin.loader, 'css-loader'],
      },
    ],
  },
};
```


main.js 中
```
import './style2.css'
```


style2.css 中
```
#app1{
    background: blue;
}
```


验证是否成功，运行以下命令，然后查看 dist 目录
```
yarn build
```


### 5. 引入 SCSS


**安装 sass-loader 和 dart-sass**


- sass-loader 依赖于 dart-sass / node-sass，优先使用 dart-sass
- sass-loader 将 SCSS 转译成 CSS



```
yarn add sass-loader dart-sass --dev
```
```
module.exports = {
    module: {
        rules: [
            {
                test: /\.scss$/i,
                use: [
                    "style-loader",
                    "css-loader",
                    {
                        loader: "sass-loader",
                        options: {
                            implementation: require("dart-sass")
                        }
                    }
                ]
            }
        ],
    },
};
```


main.js 中
```
import 'style.scss'
```


style.scss 中
```
$app2-color:blue;

#app2 {
    color: $app2-color;
}
```


### 6. 引入 LESS


**安装 less-loader 和 less**

```
yarn add less-loader less --dev
```
```
module.exports = {
  module: {
    rules: [
      {
        test: /\.less$/,
        loader: ['style-loader', 'css-loader', 'less-loader',]
      },
    ],
  },
};
```


main.js 中
```
import './style.less'
```


style.less 中
```
@color: red;

#app2{
    background: @color;
}
```


### 7. 引入 Stylus


**安装 stylus-loader 和 stylus**

```
yarn add stylus-loader stylus --dev
```
```
module.exports = {
  module: {
    rules: [
      {
        test: /\.less$/,
        loader: ['style-loader', 'css-loader', 'stylus-loader',]
      },
    ],
  },
};
```


main.js 中
```
import './style.styl'
```


style.styl 中
```
f = 40px;

#app2{
    font-size: f
}
```


### 8. 引入 图片


**安装 file-loader**


- file-loader 的作用是把文件转换成文件路径



```
yarn add file-loader --dev
```
```
module.exports = {
  module: {
    rules: [
      {
        test: /\.(png|svg|jpg|gif)$/,
        use: ['file-loader',],
      },
    ],
  },
};
```


assets 目录放入一张图片
```
src/assets/dog.jpg
```


main.js 中
```
import jpg from './assets/dog.jpg'

let div = document.querySelector('#app3')
div.innerHTML = `
    <img src="${jpg}">
`
```


### 9. 掉坑操作


- **掉坑 1：**引入 HTML 时，总是出错，我在 '<' 和 '%' 之间加了空格
- **启示 1：**代码复制粘贴要一模一样，不要多空格，不要少空格
```
<%= htmlWebpackPlugin.options.title %>
```


- **掉坑 2：**引入 CSS 时，总是出错，重启 serve 就好了
- **启示 2：**安装新 loader 后，出错了重启一下 serve 再看看结果



- **掉坑 3：**配置 dart-sass，总是出错，报错说没有安装 node-sass，把 dart-sass 卸载再重装又好了
- **启示 3：**如果出现莫名错误，把包卸载重装试试



## 五、Webpack 配置汇总


### 1. package.json


[https://github.com/mcx2020/webpack-demo-1/blob/master/package.json](https://github.com/mcx2020/webpack-demo-1/blob/master/package.json)


### 2. webpack.config.js


[https://github.com/mcx2020/webpack-demo-1/blob/master/webpack.config.js](https://github.com/mcx2020/webpack-demo-1/blob/master/webpack.config.js)


### 3. src 目录


[https://github.com/mcx2020/webpack-demo-1/tree/master/src](https://github.com/mcx2020/webpack-demo-1/tree/master/src)


### 4. src/assets 目录


[https://github.com/mcx2020/webpack-demo-1/tree/master/src/assets](https://github.com/mcx2020/webpack-demo-1/tree/master/src/assets)


## 六、预览


[https://mcx2020.github.io/webpack-demo-1/dist/](https://machaoxue.xyz/webpack-demo-1/dist/)

_「@浪里淘沙的小法师」_
