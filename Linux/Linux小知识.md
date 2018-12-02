# 平时 linux 遇到的问题解决办法和扩展小知识
## 目录
* [使用 wget 提示无法建立SSL连接](#使用-wget-提示无法建立ssl连接-top)
* [通过编译安装软件时：[Error]运行时找不到.so文件](#通过编译安装软件时error运行时找不到so文件-top)
* [apt、wget、curl 设置代理端口](#aptwgetcurl-设置代理端口-top)
* [更换 Ubuntu 18.04 LTS 登录界面背景](#更换-ubuntu-1804-lts-登录界面背景-top)
* [执行 make 命令时提示“makefile:2: *** 遗漏分隔符 停止”](#执行-make-命令时提示-makefile2--遗漏分隔符-停止-top)
* [Linux 下 gcc 编译 c 源文件过程详解](#linux-下-gcc-编译-c-源文件过程详解-top)
* [创建启动器（.Desktop文件)](#创建启动器desktop文件-top)

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
* 在 Linux 下面，共享库(*.so) 的寻找和加载是由 /lib/ld.so 实现的
     * ld.so 会在标准路经 /lib，/usr/lib 中寻找应用程序用到的共享库
     * ld.so 也会在存有非标准路径的文件夹 /etc/ld.so.conf.ld 寻找应用程序用到的共享库
* 动态链接库是为了减少发布程序的大小，可以将具有相同功能的代码模块放在动态链接库中，随应用程序一起发布；而对于应用程序来说，只需要知道其接口就可以，在运行时动态的加载代码到内存中

``` shell
./SystemArchitect: error while loading shared libraries: libqt.so.3: cannot open shared object file:
No such file or directory
```
原因：链接器 ld 提示找不到库文件

### /etc/ld.so.conf 文件和 /etc/ld.so.conf.d/ 文件夹

* Linux 中 ld 的默认目录为 /lib 和 /usr/lib，扩展库路径目录都存储在 /etc/ld.so.conf 文件里，而 /etc/ld.so.conf 的文件内容是``` include /etc/ld.so.conf.d/*.conf```，所以在 /etc/ld.so.conf.d 目录下，加入任何以 .conf 为后缀的文件，都能被 ld 链接器识别

<div align=center>
  <img src="./images/ld.so.conf文件.jpg"><br/>/etc/ld.so.conf 文件
 </div>
 
 <div align=center>
  <img src="./images/ld.so.conf.d文件夹.jpg"><br/>/etc/ld.so.conf.d/文件夹
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

* ldconfig 是一个动态链接库管理命令，其目的为了让动态链接库为系统所共享
* ldconfig 默认搜寻/lib 和 /usr/lib 以及动态库配置文件 /etc/ld.so.conf 内所列的目录下的库文件
* ldconfig 会搜索出所有库，进而创建动态装入程序(ld.so)所需的连接和产生缓存文件 /etc/ld.so.cache（该文件保存已排好序的动态链接库名字列表）
* ldconfig 通常在系统启动时运行，而当用户安装了一个新的动态链接库时，就需要手工运行这个命令

### 新增库文件（.so文件）方法

* 若库文件已经在 /lib 和 /usr/lib 里面，是不用修改 /etc/ld.so.conf 文件的，但是添加完后需要调用下 ldconfig，不然添加的 library 会找不到
* .so 文件不在 /lib 和 /usr/lib 里，新增库路径方法
    * 直接在 /etc/ld.so.conf 文件中后续添加
    * 将库文件路径写入 /etc/ld.so.conf.d/ 文件夹中的 .conf 文件中
    * 在 /etc/ld.so.conf.d/ 文件夹中添加新的 .conf 文件
* 如果添加的库不在 /lib 或 /usr/lib 下，但是却没有权限操作写 /etc/ld.so.conf 文件的话，这时就需要往 export 里写一个全局变量```LD_LIBRARY_PATH```就可以了
> ld.so.cache 的更新是递增式的，就像 PATH 系统环境变量一样，不是从头重新建立，而是向上累加，只有重新开机，系统才从零开始建立 ld.so.cache 文件。所以每次修改 /etc/ld.so.conf 文件或 /etc/ld.so.conf.d/ 文件夹都要执行一次命令：<kbd>ldconfig</kbd>


## apt、wget、curl 设置代理端口 [[Top]](#目录)

## 更换 Ubuntu 18.04 LTS 登录界面背景 [[Top]](#目录)

<div align=center>
  <img src="./images/登录界面.png"><br/>Ubuntu 18.04 LTS 默认登录界面
</div>

### 修改 /usr/share/gnome-shell/theme/ubuntu.css 或 /usr/share/gnome-shell/theme/gdm3.css 文件

> * Ubuntu 18.04 用的 Gnome 的桌面，和以前 Unity 桌面配置方式不同，所以 16.04 及以前版本修改方法与此不同
> * ubuntu.css 和 gdm3.css 内容相同，只需修改其一即可

修改该文件第 1814 行左右（#lockDialogGroup)：
修改前：
``` css
#lockDialogGroup {
  background: #2c001e url(resource:///org/gnome/shell/theme/noise-texture.png);
  background-repeat: repeat; }
```
修改后：
``` css
#lockDialogGroup {
  background: #2c001e url(file:///usr/share/gnome-shell/theme/denglubeijing.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
   }
```

## 执行 make 命令时提示 “makefile:2: *** 遗漏分隔符 停止" [[Top]](#目录)

> 分析原因：gcc、rm、cp 前面是 tab 分割符，不能用空格，make 中规定每一 Shell 命令之前的开头必须使用字符

``` shell
# makefile 文件部分示例
all:
    gcc -o helloworld helloworld.c
fresh:
    rm -rf Makefile
clean:
    rm -rf helloworld helloworld.o
install:
    cp helloworld /usr/bin
uninstall:
    rm -rf /usr/bin/helloworld
```

## Linux 下 gcc 编译 c 源文件过程详解 [[Top]](#目录)

<div align=center>
    <img src="./images/gcc.png" /><br/>gcc 编译过程图
</div>


<div align=center>
    <img src="./images/gcc过程.png" /><br/>gcc 编译过程文件变化图
</div>

* Linux 下与 C 语言有关的文件类型
    * .c - 源代码文件
    * .h - C语言头文件
    * .i - 经过预处理之后的源代码文件
    * .s - 汇编代码文件
    * .o - 目标代码文件（二进制机器指令文件）
    * .a - 静态对象库文件
    * .so - 共享（动态）对象库文件

<div align=center>
    <img src="./images/test.c.jpg" width="75%" heigth="75%" /><br/>test.c 源文件
</div>

### 预编译（预处理 - Preprocessing） - ``` gcc -E test.c -o test.i```

<div align=center>
    <img src="./images/test.i.jpg" width="75%" heigth="75%" /><br/>test.i 源文件预处理生成的文件
</div>

### 编译（Compilation） - ``` gcc -S test.i -o test.s```

<div align=center>
    <img src="./images/test.s.jpg" width="75%" heigth="75%" /><br/>test.s 经编译生成的汇编文件
</div>

> 此阶段会检查代码逻辑，若出现错误会中断编译提示

<div align=center>
    <img src="./images/编译出错.jpg" width="75%" heigth="75%" /><br/>test.s 编译出错中断提示
</div>


### 汇编(Assembly) - ``` gcc -c test.s -o test.o```

<div align=center>
    <img src="./images/test.o.jpg" width="75%" heigth="75%" /><br/>test.o 由汇编文件生成的二进制文件
</div>

### 链接(Linking) - ```gcc test.o test```

<div align=center>
    <img src="./images/test.jpg" width="75%" heigth="75%" /><br/>test 链接后生成的可执行文件
</div>

### 多个 c 源文件生成一个可执行文件
方法一、
``` shell
gcc test1.c test2.c -o test
```
方法二、
``` shell
gcc -c test1.c -o test1.o
gcc -c test2.c -o test2.o
gcc test1.o test2.o -o test
```

> 第一种方法编译时需要所有文件重新编译，而第二种方法可以只重新编译修改的文件，未修改的文件不用重新编译

### [补充参考]
[gcc 编译过程详解](http://www.cnblogs.com/ggjucheng/archive/2011/12/14/2287738.html#_Toc311642851)

## 创建启动器（.Desktop文件) [[Top]](#目录)

* 在 Linux 中，一个 .desktop 文件就是一个用来运行程序的快捷方式，没有此文件，你的应用就不会在应用菜单中显示。例如从源代码中编译的程序或者自己下载的压缩格式的应用，每次都需要打开终端来执行它的二进制文件
* desktop 文件路径：
    * 仅对当前用户可见：<kbd>~/.local/share/applications</kbd>
    * 所有用户可见：<kbd>/usr/share/applications/</kbd>

### desktop 文件创建
``` shell
$ touch test.desktop
```
### test.desktop 文件内容
``` shell
[Desktop Entry]
Encoding=UTF-8
Name=IntelliJ IDEA
GenericName=IntelliJ IDEA
Comment=The Java IDE for Professional Developers by JetBrains
Exec=/opt/SoftWare/idea-IU-172.4343.14/bin/idea.sh %f
Icon=/opt/SoftWare/idea-IU-172.4343.14/bin/idea.png
Terminal=false
Type=Application
Categories=Application;Programme;

语法解释：
关键词                         意义
[Desktop Entry]               文件头
Encoding                      编码
Name                          应用名称
Name[xx]                      不同语言的应用名称
GenericName                   描述
Comment                       注释
Exec                          执行的命令
Icon                          图标路径
Terminal                      是否使用终端
Type                          启动器类型
Categories                    应用的类型（内容相关）
说明： 
其中 Exec 常用的参数有：%f %F %u %U 
%f：单个文件名，即使选择了多个文件。如果已选择的文件不在本地文件系统中（比如说在HTTP或者FTP上），这个文件将被作为一个临时文件复制到本地，％f将指向本地临时文件； 
%F：文件列表。用于程序可以同时打开多个本地文件。每个文件以分割段的方式传递给执行程序。 
%u：单个URL。本地文件以文件URL或文件路径的方式传递。 
%U：URL列表。每个URL以分割段的方式传递给执行程序。本地文件以文件URL或文件路径的方式传递
```
### 修改权限:
``` shell
$ chmod 755 test.desktop
```

## 一段脚本片段 [[Top]](#目录)
``` shell
#!/bin/bash
# Don't generate .pyc files
export PYTHONDONTWRITEBYTECODE=1
```
