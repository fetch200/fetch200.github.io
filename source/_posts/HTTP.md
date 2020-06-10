---
title: HTTP
date: 2020/4/24 20:00:00
categories: 基础知识
---

HTTP 的相关知识，内容包括 URL、IP、域名、端口页面请求、HTTP 请求和响应、Curl 命令制造请求、HTTP 缓存、其他知识。


## 一、URL


什么是 URL ？URL 的全称是 Uniform Resource Locator， 统一资源定位服务，能够定位到一个设备给我们提供的服务，由以下几个部分组成。

协议 + 域名或 IP + 端口号 + 路径 + 查询字符串 + 锚点


## 二、IP、域名、端口


### 1. IP 和域名


什么是 IP ？IP 全称 Internet Protocol，互联网协议。只要在互联网中，就至少有一个独特的 IP。


域名是对 IP 的别称，通过 DNS，Domain Name Server/System 将域名和 IP 对应起来。

1. 一个域名可以对应不同 IP，这个叫均衡负载，防止一台机器扛不住
1. 一个 IP 可以对应不同域名，这个叫做共享主机



### 2. IP 分为内网和外网


1. 路由器连上电信的服务器，那么路由器就会有一个「外网 IP」
1. 路由器会在家中创建一个内网，内网中的设备使用「内网 IP」，一般来说这个 IP 的格式都是 192.168.xxx.xxx



### 3. 获取/查询 IP


这个网站可以获取到自己现在上网的「外网 IP」→ [_https://ip138.com/_](https://ip138.com/)

ping 命令用于测试网络是否连通
```
ping baidu.com
```


nslookup 命令用于查询 DNS 的记录，查看域名解析是否正常
```
nslookup baidu.com
```


### 4. 端口


一台机器可以提供很多服务，一个服务就是一个端口，拥有一个端口号（port）。

1. 要提供 HTTP 服务最好使用 80 端口
1. 要提供 HTTPS 服务最好使用 443 端口
1. 要提供 FTP 服务最好使用 21 端口



一共 65535 个端口，1 到 1023（2 的 10 次方减 1）号端口留给系统使用的，其他端口可以留给普通用户使用

## 三、页面请求


协议 + 域名 + 路径 + 查询参数
```
https://www.baidu.com/s?wd=hello
https://www.google.com/search?q=hello
```
协议 + 域名 + 路径 + 锚点
```
https://zh.wikipedia.org/wiki/维基百科#使用
```
锚点看起来有中文，实际不支持中文，并且锚点是无法在 Network 面板看到的，它不会传给服务器。

## 四、HTTP 请求和响应


### 1. HTTP 请求


有三部分：请求行、请求头、请求体。


请求动词有 GET / POST / PUT / PATCH / DELETE 等，请求体在 GET 请求中一般为空。
```
请求动词 路径加查询参数 协议名/版本
......
Host: 域名或 IP: 端口号
Accept: text/html
Content - Type: 请求体的格式

请求体（也就是上传的内容）
```


### 2. HTTP 响应


有三部分：状态行、响应头、响应体。
```
协议名/版本 状态码 状态字符串
......
Content-Type: 响应体格式

响应体（也就是下载内容）
```


## 五、Curl 命令构造请求


### 1. 构造一个简单的请求


-v 参数可以清晰地看到请求和响应
```
curl http://www.baidu.com
curl -v http://www.baidu.com
```


我们请求 http://www.baidu.com 看看得到什么
```
λ curl -v http://www.baidu.com
*   Trying 36.152.44.96:80...
* TCP_NODELAY set
* Connected to www.baidu.com (36.152.44.96) port 80 (#0)
> GET / HTTP/1.1
> Host: www.baidu.com
> User-Agent: curl/7.67.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Accept-Ranges: bytes
< Cache-Control: private, no-cache, no-store, proxy-revalidate, no-transform
< Connection: keep-alive
< Content-Length: 2381
< Content-Type: text/html
< Date: Fri, 17 Apr 2020 10:23:27 GMT
< Etag: "588604f8-94d"
< Last-Modified: Mon, 23 Jan 2017 13:28:24 GMT
< Pragma: no-cache
< Server: bfe/1.0.8.18
< Set-Cookie: BDORZ=27315; max-age=86400; domain=.baidu.com; path=/
<
<!DOCTYPE html>
<!--STATUS OK--><html> <head><meta http-equiv=content-type content=text/html;charset=utf-8><meta http-equiv=X-UA-Compatible content=IE=Edge><meta content=always name=referrer><link rel=stylesheet type=text/css href=http://s1.bdstatic.com/r/www/cache/bdorz/baidu.min.css><title>百度一下，你就知道</title></head> <bo
dy link=#0000cc> <div id=wrapper> <div id=head> <div class=head_wrapper> <div class=s_form> <div class=s_form_wrapper> <div id=lg> <img hidefocus=true src=//www.baidu.com/img/bd_logo1.png width=270 height=129> </div> <form id=form name=f action=//www.baidu.com/s class=fm> <input type=hidden name=bdorz_come value=1> <input type=hidden name=ie value=utf-8> <input type=hidden name=f value=8> <input type=hidden name=rsv_bp value=1> <input type=hidden name=rsv_idx value=1> <input type=hidden name=tn value=baidu><span class="bg s_ipt_wr"><input id=kw name=wd class=s_ipt value maxlength=255 autocomplete=off autofocus></span><span class="bg s_btn_wr"><input type=submit id=su value=百度一下 class="bg s_btn"></span> </form> </div> </div> <div id=u1> <a href=http://news.baidu.com name=
tj_trnews class=mnav>新闻</a> <a href=http://www.hao123.com name=tj_trhao123 class=mnav>hao123</a> <a href=http://map.baidu.com name=tj_trmap class=mnav>地图
</a> <a href=http://v.baidu.com name=tj_trvideo class=mnav>视频</a> <a href=http://tieba.baidu.com name=tj_trtieba class=mnav>贴吧</a> <noscript> <a href=htt
p://www.baidu.com/bdorz/login.gif?login&amp;tpl=mn&amp;u=http%3A%2F%2Fwww.baidu.com%2f%3fbdorz_come%3d1 name=tj_login class=lb>登录</a> </noscript> <script>d
ocument.write('<a href="http://www.baidu.com/bdorz/login.gif?login&tpl=mn&u='+ encodeURIComponent(window.location.href+ (window.location.search === "" ? "?" : "&")+ "bdorz_come=1")+ '" name="tj_login" class="lb">登录</a>');</script> <a href=//www.baidu.com/more/ name=tj_briicon class=bri style="display: block;">
更多产品</a> </div> </div> </div> <div id=ftCon> <div id=ftConw> <p id=lh> <a href=http://home.baidu.com>关于百度</a> <a href=http://ir.baidu.com>About Baidu
</a> </p> <p id=cp>&copy;2017&nbsp;Baidu&nbsp;<a href=http://www.baidu.com/duty/>使用百度前必读</a>&nbsp; <a href=http://jianyi.baidu.com/ class=cp-feedback>
意见反馈</a>&nbsp;京ICP证030173号&nbsp; <img src=//www.baidu.com/img/gs.gif> </p> </div> </div> </div> </body> </html>
* Connection #0 to host www.baidu.com left intact
```


### 2. 设置请求


修改请求动词
```
curl -v -X POST https://www.baidu.com
```


设置路径和查询参数
```
curl -v https://www.baidu.com/s?wd=hello
```


设置请求头
```
curl -v -H "Accept: text/html" https://www.baidu.com
```


设置请求体内容
```
curl -v -X POST -H "Content-Type: text/plain;charset=utf-8" -d "请求体内容" https://www.baidu.com
```


## 六、HTTP 缓存


缓存是跟着文件名走的，在响应头里可以看到缓存时间


```
Response Header
Cache-Control:public, max-age=31536000
```


## 七、其他知识


浏览器标签最右侧的圈圈：逆时针转表示在请求，顺时针转表示在下载


_「@浪里淘沙的小法师」_
