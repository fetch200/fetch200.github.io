---
title: GitHub
date: 2020/4/25 19:00:00
index_img: /img/basis.jpg
categories: 基础知识
---

GitHub 的相关知识，内容包括简介、配置 SSH Key、配置域名、上传代码并设置 Pages、GitHub 的代替品。


## 一、简介


GitHub 是通过 Git 进行版本控制的软件源代码托管服务平台。

官网：→ [_点击这里_](https://github.com/)


1. 配置 SSH Key
1. 可以配置域名
1. 上传代码并设置 Pages



## 二、配置 SSH Key


GitHub 有生成 SSH Key 帮助文档：→ [_点击这里_](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)


「Settings」→「SSH and GPG keys」→「New SSH key」→「Title: <给设备取名字>」+「Key: <公钥>」


![image.png](https://cdn.nlark.com/yuque/0/2020/png/916537/1587104930810-ac6afdda-bd9d-4d8a-998d-750036cb6074.png#align=left&display=inline&height=290&margin=%5Bobject%20Object%5D&name=image.png&originHeight=536&originWidth=1251&size=43836&status=done&style=none&width=678)


## 三、配置域名


如果自己购买了域名，可以自己配置域名。


**注意：**自己做的博客主页的仓库名必须是 **<用户名>.github.io**


1. 在 GitHub Pages 的 Custom domain 写上自己的域名。
1. 设置顶级域，在自己的域名上创建四条 A 记录 → [_GitHub 顶级域设置教程_](https://help.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain)
```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```
可以使用 nslookup <域名> 查看域名是否生效了
![image.png](https://cdn.nlark.com/yuque/0/2020/png/916537/1587108392758-97ff8087-45c8-4f44-bdd8-67f515e9b830.png#align=left&display=inline&height=197&margin=%5Bobject%20Object%5D&name=image.png&originHeight=328&originWidth=1243&size=37265&status=done&style=none&width=746)


## 四、上传代码并设置 Pages


```
git remote add origin git@github.com:mcx2020/webpack-demo-1.git
git push -u origin master
```


「Settings」→「GitHub Pages」

## 五、GitHub 的代替品


1. gitee.com（码云）→ [_点击这里_](https://gitee.com/)
1. coding.net（腾讯战略投资）→ [_点击这里_](https://coding.net/)
1. gitlab.com → [_点击这里_](https://about.gitlab.com/)



_「@浪里淘沙的小法师」_


