# 平时 linux 遇到的问题解决和小知识
## 目录
* [使用 wget 提示无法建立SSL连接](#使用-wget-提示无法建立ssl连接-top)
* [通过编译安装软件时：[Error]运行时找不到.so文件](#通过编译安装软件时error运行时找不到so文件-top)
* [apt、wget、curl 设置代理端口](#aptwgetcurl-设置代理端口-top)


## 使用 wget 提示无法建立SSL连接 [[Top]](#目录)

``` shell
[root@localhost ~]# wget https://www.kernel.org/pub/software/scm/git/git-2.0.5.tar.gz
--2018-03-22 01:43:37--  https://www.kernel.org/pub/software/scm/git/git-2.0.5.tar.gz
Resolving www.kernel.org... 147.75.42.139, 2604:1380:40a0:500::1
Connecting to www.kernel.org|147.75.42.139|:443... connected.
ERROR: certificate common name “kernel.org” doesn’t match requested host name “www.kernel.org”.
To connect to www.kernel.org insecurely, use ‘--no-check-certificate’.
```
> 这是因为 wget 在使用 HTTPS 协议时，默认会去验证网站的证书，而这个证书验证经常会失败，加上 "--no-check-certificate" 选项，就能排除掉这个错误

## 通过编译安装软件时：[Error]运行时找不到.so文件 [[Top]](#目录)

* 在 linux 下，.so 文件相当与 windows 上的 dll 文件，即动态链接库
* 动态链接库是为了减少发布程序的大小，可以将具有相同功能的代码模块放在动态链接库中，随应用程序一起发布；而对于应用程序来说，只需要知道其接口就可以，在运行时动态的加载代码到内存中

``` shell
./SystemArchitect: error while loading shared libraries: libqt.so.3: cannot open shared object file:
No such file or directory
```
原因：链接器 ld 提示找不到库文件

### /etc/ld.so.conf 文件和 /etc/ld.so.conf.d/ 文件夹

* Linux 中的库路径都存储在 /etc/ld.so.conf 文件里，而 /etc/ld.so.conf 的文件内容是``` include /etc/ld.so.conf.d/*.conf```，所以在 /etc/ld.so.conf.d 目录下，加入任何以 .conf 为后缀的文件，都能被 ld 链接器识别
* 若要新增库文件路径
    * 直接在 /etc/ld.so.conf 文件中后续添加
    * 将库文件路径写入 /etc/ld.so.conf.d/ 文件夹中的 .conf 文件中
    * 在 /etc/ld.so.conf.d/ 文件夹中添加新的 .conf 文件

> ld.so.cache 的更新是递增式的，就像 PATH 系统环境变量一样，不是从头重新建立，而是向上累加，只有重新开机，系统才从零开始建立 ld.so.cache 文件。所以每次修改 /etc/ld.so.conf 文件或 /etc/ld.so.conf.d/ 文件夹都要执行一次命令：<kbd>ldconfig</kbd>

<div align=center>
  <img src="./images/ld.so.conf文件.jpg" width="75%" heigth="75%"><br/>/etc/ld.so.conf 文件
 </div>
 
 <div align=center>
  <img src="./images/ld.so.conf.d文件夹.jpg" width="75%" heigth="75%"><br/>/etc/ld.so.conf.d/文件夹
 </div>
 
### 查看某个库是否安装
``` shell
# 查看 libqt.so 是否安装
ldconfig -p | grep qt
ldconfig -p | grep qt
# ldconfig -p: 打印当前缓存所保存的所有库的名字
# grep qt/libqt: 用管道符解析 libqt.so 是否已加入缓存中
# qt 会打印所有 *qt.so.* 库文件信息，可以联想搜索；libqt 只会搜索 libqt.so.* 是否安装，若不存在不会返回显示
```
ldconfig 是在默认搜寻目录 /lib 和 /usr/lib 以及动态库配置文件 /etc/ld.so.conf 内所列目录下，搜索出可共享的动态链接库 - 格式 libxxx.so.xx，进而创建出动态装入程序( ld.so )所需的连接和缓存文件。缓存文件默认为 /etc/ld.so.cache，此文件保存已排好序的动态链接库名字列表，为了让动态链接库为系统所共享，需运行动态链接库的管理命令 ldconfig


## apt、wget、curl 设置代理端口 [[Top]](#目录)

## 一段脚本片段 [[Top]](#目录)
``` shell
#!/bin/bash
# Don't generate .pyc files
export PYTHONDONTWRITEBYTECODE=1
```
