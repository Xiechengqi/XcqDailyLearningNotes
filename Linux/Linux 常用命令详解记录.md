# 记录平时常用易忘的 Linux 命令
## 目录
* [wget](#wget---world-wide-web-get-top)<br/>
* []()<br/>
* []()<br/>
* []()<br/>
* []()<br/>
* []()<br/>

## [wget] - World Wide Web Get [[Top]](#目录)

格式：wget [ ]  [URL地址]
### 常用命令[[详细]](./LinuxCommand/wget.txt)
``` shell
// 支持断点续传
wget -c URL

// 获取https地址时不检查证书
wget --no-check-certificate URL

// 后台下载文件
wget -b URL     //查看下载进度命令：tail -f wget-log 

// 测试下载链接
wget --spider URL

// 设定下载带宽上线，实现限速下载
wget --limit-rate 数字k(千字节)/m(兆字节) URL

// 访问需认证的页面
wget --user username -password password URL    //指定–user 和–password参数
wget --user username --ask-password pass URL    //不指定密码，而由网页提示并手动的输入密码

// 从保存多个链接的文件读取 URL 并下载（又称递归下载）
cat > filelist.txt url1 url2 url3 url4
wget -i filelist.txt 

// 限制总下载文件大小
wget -Q 5m -i filelist.txt   //想要下载的文件超过5M而退出下载，-Q 参数对单个文件下载不起作用，只能递归下载时才有效
```
* wget 支持 HTTP，HTTPS 和 FTP 协议，支持FTP和HTTP下载方式，支持 http、https 代理（但不支持 socks 代理）
