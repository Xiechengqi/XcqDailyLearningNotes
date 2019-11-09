# 记录平时常用易忘的 Linux 命令
## 目录

* [系统信息](#系统信息-top)<br/>
* [硬件信息](#硬件信息-top)<br/>
* [性能分析](./LinuxCommand/Linux%20性能相关常用命令.md)<br/>
* [日志管理](#日志管理-top)<br/>
* [wget](#wget---world-wide-web-get-top)<br/>
* [gcc](#gcc---gnu-c-compiler---gnu-compiler-collection-top)<br/>
* [sed]()<br/>
* [awk]()<br/>
* [grep]()<br/>
* [tr]()<br/>
* [wc]()<br/>
* []()<br/>
* []()<br/>
* []()<br/>
* []()<br/>
* []()<br/>

# 系统信息 [[Top]](#目录)

``` shell
uname -a                          # 查看 Linux 内核版本信息

cat /proc/version           # 查看内核版本

cat /etc/issue                   # 查看系统版本

lsb_release -a                   # 查看系统版本，可以带各种参数, -a ALL

locale -a                              # 列出所有语系

locale                                   # 当前环境变量中所有编码

hwclock                              # 查看时间

who                                     # 显示已登录用户

w                                          # 显示已登录用户并显示它们正在执行任务

whoami                         # 查看当前用户名

logname                         # 查看初始登录用户名

uptime                                # 查看服务器启动时间

sar -n DEV 1 10                  # 查看网卡网速流量

dmesg                                # 显示开机信息

lsmod                                # 查看内核模块
```
## 硬件信息 [[Top]](#目录)

``` shell
lscpu# 查看 CPU 信息
more /proc/cpuinfo# 查看 CPU 信息
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c # 查看 CPU 型号和逻辑核心数
getconf LONG_BIT # CPU 运行的位数
cat /proc/cpuinfo | grep 'physical id' | sort | uniq -c # 物理 CPU 个数
cat /proc/cpuinfo | grep flags | grep 'lm' | wc -l # 结果大于 0 则支持 64 位
more /proc/meminfo # 查看内存信息
dmidecode # 查看全面硬件信息
dmidecode | grep "Product Name" # 查看服务器型号
dmidecode | grep -P -A5 "Memory\s+Device" | grep Size | grep -v Range # 查看内存插槽
cat /proc/mdstat # 查看软 raid 信息
cat /proc/scsi/scsi # 查看 Dell 硬 raid 信息 ( IBM、HP 需要官方检测工具 )
lspci # 查看硬件信息
lspci | grep RAID # 查看是否支持 RAID
lspci -vvv | grep Ethernet # 查看网卡型号
lspci -vvv | grep Kernel | grep driver # 查看驱动模块
modinfo tg2 # 查看驱动版本 ( 驱动模块 )
ethtool -i <网卡名> # 查看网卡驱动版本，先用 ip -a 查看网卡名
```

## 日志管理 [[Top]](#目录)

``` shell

```

## sed 

* 文本筛选和格式转换的流式编辑器
* <kbd>**sed [选项] ... {命令或脚本} [输入文件] ...**</kbd>


## [wget] - World Wide Web Get [[Top]](#目录)

<kbd>**wget [ ]  [URL地址]**</kbd>

### 常用命令
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

## gcc - GNU C Compiler - GNU Compiler Collection [[Top]](#目录)

> [gcc 编译 c 源文件过程详解](/Linux/Linux小知识.md#linux-下-gcc-编译-c-源文件过程详解-top)

* gcc 命令使用 GNU 推出的基于 C/C++ 的编译器，是开放源代码领域应用最广泛的编译器，具有功能强大，编译代码支持性能优化等特点
* 经过了这么多年的发展，GCC 已经不仅仅能支持 C 语言；它现在还支持 Ada 语言、C++ 语言、Java 语言、Objective C 语言、Pascal 语言、COBOL 语言，以及支持函数式编程和逻辑编程的 Mercury 语言，等等

格式：gcc [选项] [参数]
选项：
-o：指定生成的输出文件；
-E：仅执行编译预处理；
-S：将C代码转换为汇编代码；
-wall：显示警告信息；
-c：仅执行编译操作，不进行连接操作

``` shell
// 无选项编译链接 - 将 test.c 预处理、汇编、编译并链接形成可执行文件，这里未指定输出文件，默认输出为 a.out
gcc test.c

// 将 test.c 预处理、汇编、编译并链接形成可执行文件 test，-o 选项用来指定输出文件的文件名
gcc test.c -o test

// 将 test.c 预处理输出 test.i 文件
gcc -E test.c -o test.i
gcc -E test.c    //直接在终端输出显示 test.i 文件内容
 
// 将预处理输出文件 test.i 汇编成 test.s 文件
gcc -S test.c   //会生成 test.s 文件
gcc -S test.i
gcc -S test.i -o test.s

// 将汇编输出文件 test.s 编译输出二进制 test.o 文件
gcc -c test.c     //会生成 test.o 文件
gcc -c test.o
gcc -c test.s -o test.o


// 将编译输出文件 test.o 链接成最终可执行文件 test
gcc test.o -o test

// 多个文件一起编译
gcc test1.c test2.c -o test
//或
gcc -c test1.c -o test1.o
gcc -c test2.c -o test2.o
gcc test1.o test2.o -o test
```
