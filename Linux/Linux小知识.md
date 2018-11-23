＃ 平时 linux 遇到的问题解决和小知识

## 使用 wget 提示无法建立SSL连接

``` shell
[root@localhost ~]# wget https://www.kernel.org/pub/software/scm/git/git-2.0.5.tar.gz
--2018-03-22 01:43:37--  https://www.kernel.org/pub/software/scm/git/git-2.0.5.tar.gz
Resolving www.kernel.org... 147.75.42.139, 2604:1380:40a0:500::1
Connecting to www.kernel.org|147.75.42.139|:443... connected.
ERROR: certificate common name “kernel.org” doesn’t match requested host name “www.kernel.org”.
To connect to www.kernel.org insecurely, use ‘--no-check-certificate’.
```
> 这是因为 wget 在使用 HTTPS 协议时，默认会去验证网站的证书，而这个证书验证经常会失败，加上 "--no-check-certificate" 选项，就能排除掉这个错误

## apt、wget、curl 设置代理端口
