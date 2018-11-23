# 记录平时常用易忘的 Linux 命令
## 目录
* [Wget](#wget---world-wide-web-get-top)<br/>
* []()<br/>
* []()<br/>
* []()<br/>
* []()<br/>
* []()<br/>

## [Wget](./LinuxCommand/wget.txt) - World Wide Web Get[[Top]](#目录)

格式：wget []  [URL地址]
``` shell
// 支持断点续传
wget -c URL
// 获取https地址时不检查证书
wget --no-check-certificate URL
// 后台下载文件
wget -b URL
// 测试下载链接
wget --spider URL
// 设定下载带宽上线，实现限速下载
wget --limit-rate 数字k(千字节)/m(兆字节) URL
// 访问需认证的页面
wget --user username -password password URL    //指定–user 和–password参数
wget --user username --ask-password pass URL    //不指定密码，而由网页提示并手动的输入密码
```
* GNU Wget（常简称为Wget）是一个在网络上进行下载的简单而强大的自由软件，其本身也是GNU计划的一部分
* 目前它支持通过HTTP、HTTPS，以及FTP这三个最常见的TCP/IP协议协议下载
