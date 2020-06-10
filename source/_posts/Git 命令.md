---
title: Git 命令
date: 2020/4/24 19:00:00
categories: 基础知识
---

自己使用的常用 Git 命令，内容包括 Git 配置、基本操作、切换版本、创建分支、合并分支、提交到远程仓库、高级操作。


## 一、Git 配置


### 1. 六行配置


```
git config --global user.name <名字>
git config --global user.email <邮箱>
git config --global push.default simple
git config --global core.quotepath false
git config --global core.editor "code --wait"
git config --global core.autocrlf input
```


### 2. 查看配置


```
git config --global --list
```


### 3. 删除配置


```
git config --global --unset <配置的名字>
```


## 二、基本操作


### 1. 初始化一个空的 Git 仓库


```
git init
```


### 2. 忽略提交特定的文件(夹)


在目录新建一个 .gitignore 目录，将想要忽略提交的内容添加即可


```
/index.html
/style.css
```


### 3. 提交代码一键三连


1. 查看文件处于什么状态
1. 将内容从工作目录添加到暂存区
1. 将暂存区里的改动提交到本地的版本库



```
git status
git add .
git commit -m "<字符串>"  / git commit -v
```


## 三、切换版本


### 1. 查看版本历史


查看正常迭代的版本历史


```
git log
```


所有分支的所有操作记录


```
git reflog
```


按 “Q” 回到命令行


### 2. 切换版本


根据版本号切换版本


```
git reset --hard <版本号>
```


切换到上一个版本


```
git reset --hard HEAD
```


按 “Q” 回到命令行


## 四、创建分支


### 1. 创建一个新分支


创建一个分支


```
git branch <分支名>
```


### 2. 切换分支


```
git checkout <分支名>
```


切换到上一个分支


```
git checkout -
```


## 五、合并分支


### 1. 合并分支


到达你想要保留的那个分支，并确定要合并的分支


```
git checkout master
git merge x
```


有冲突解决冲突，打开冲突文件，做优化


查看冲突文件，-sb 让查看界面更简洁


```
git status -sb
```


### 2. 提交代码


```
git add .
git commit
```


这里 commit 后面不需要加任何内容，它会自动添加提交的内容


### 3. 删除原来的无用分支


先查看分支，-d 的意思是 delete


```
git branch
git branch -d x
```


## 六、提交到远程仓库


### 1. 提交到 GitHub 远程仓库


先新建一个远程仓库，复制粘贴运行以下命令，origin 是给远程仓库取的名字，可以修改的


```
git remote add origin git@github.com:mcx2020/webpack-demo-1.git
git push -u origin master
```


push 的杀手锏，强制 push（不要轻易使用）


```
git push -u origin master -f
```
### 
### 2. 提交到码云远程仓库


```
git remote add gitee git@gitee.com:mcx2020/webpack-demo-1.git
git push gitee gh-pages:master
```


将本地的 gh-pages 分支提交到远程仓库的 master 分支


### 3. 查看添加的远程仓库


```
git remote -v
```


### 4. 换仓库提交


提交的时候，如果想换仓库，将 add 改成 set-url


```
git remote set-url origin git@github.com:mcx2020/webpack-demo-2.git
git push -u origin master
```


## 七、下载远程仓库


### 1. 下载代码


别人的代码只能使用 https 下载，自己的代码可是使用 ssh 下载，下载形式有变形。


```
git clone git@<目标路径>
git clone git@<目标路径> yyy
git clone git@<目标路径> .
```


## 八、高级操作


### 1. 通灵术


将所有未提交的代码隐藏存储起来，再切换分支弹出来


```
git stash
// 切换一下分支
git stash pop
```


### 2. 设置页面预览的脚本


将打包好的 dist 中的文件上传到新的分支进行预览


```
git branch "gh-pages"
git check-out gh-pages
// 将已经删除源代码的代码提交
git add .
git commit -m "rm source code"
git push --set-upstream origin gh-pages
```


在 master 分支上做一个脚本


```
// deploy.sh
yarn build &&
git checkout gh-pages &&
rm -f *.html *.js *.css &&
mv dist/* ./ &&
rm -rf dist;
git add . &&
git commit -m 'update' &&
git push &&
git checkout -
```


_「@浪里淘沙的小法师」_
