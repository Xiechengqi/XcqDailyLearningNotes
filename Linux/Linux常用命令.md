# 记录平时常用易忘的 Linux 命令
## 目录
* [wget](#wget---world-wide-web-get-top)<br/>
* [gcc](#gcc---gnu-c-compiler---gnu-compiler-collection-top)<br/>
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

## gcc - GNU C Compiler - GNU Compiler Collection [[Top]](#目录)

> [gcc 编译 c 源文件过程详解](./Linux/Linux小知识.md#linux-下-gcc-编译-c-源文件过程详解-top)

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
