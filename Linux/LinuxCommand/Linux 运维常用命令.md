# Linux 运维常用命令查询

> * Ubuntu 18.04 LTS

## 目录

* CPU
  * top
  * pidstat
  * mpstat
  * dstat
  * perf
* Ethernet ( 以太网 )
  * tcpdump
  * ip
  * nicstat
  * dtrace  
* Port ( 端口 )
  * ping
  * dastat
  * dtrace
* Disk ( 磁盘 )
  * dastat
  * dtrace
* ps
* lsof
* netstat

* ipconfig
* vmstat
* slabtop
* free

* nicstat


## top - display Linux processes

* 显示当前系统正在执行的进程的相关信息，包括进程 ID、内存占用率、CPU 占用率等
* <kbd>top [选项] ([参数])</kbd>
* <kbd>[选项] ([参数])</kbd>
  * -b 批处理
  * -c 显示完整的治命令
  * -I 忽略失效过程
  * -s 保密模式
  * -S 累积模式
  * -d <时间> 设置更新间隔时间
  * -u <用户名> 指定用户名
  * -p <进程号> 指定进程
  * -n <次数> 循环显示的次数
  
### 常用命令
```
top         #显示系统进程信息
top -b      #以批处理模式显示程序信息
top -S      #以累积模式显示程序信息
top -n 2   #设置信息更新次数,表示更新 2 次后终止更新显示
top -d -3   #设置信息更新时间,表示更新周期为 3 秒
top -p 1138  #显示进程号为1138 的进程信息，CPU、内存占用率等
```

### 输出详解

 ``` shell
 $ top
top - 11:32:24 up  6:37,  0 users,  load average: 0.50, 0.55, 0.52
Tasks:   2 total,   1 running,   1 sleeping,   0 stopped,   0 zombie
%Cpu(s):  4.3 us,  1.4 sy,  0.2 ni, 93.3 id,  0.7 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  8055256 total,   444928 free,  4203968 used,  3406360 buff/cache
KiB Swap:  8275964 total,  8273784 free,     2180 used.  3538032 avail Mem 

  PID  USER      PR  NI    VIRT      RES     SHR  S  %CPU %MEM     TIME+ COMMAND                                                             
    1     root        20   0     18508    3188   2776 S     0.0         0.0            0:00.21 bash                                                                
   10    root        20   0    36484    2940    2540 R     0.0         0.0           0:00.01 top
 ```
 * **第一行：与 `uptime` 输出的信息一样**
   * `11:32:24 ` - 当前系统时间 
   * `up  6:37` -  系统已运行时间
   * `0 users` - 当前连接系统的终端数 系统负载
   * `load average: 0.50, 0.55, 0.52` - 后面的三个数分别是 1 分钟、5 分钟、15 分钟的负载情况；如果平均负载值大于 0.7 * CPU 内核数，就需要引起关注
* **第二行：表示进程数信息**
  * `2 total` - 总进程数
  * `1 running` - 正在运行的进程数
  * `1 sleeping` - 正在睡眠的进程数
  * `0 stopped` - 停止的进程数
  * `0 zombie` - 僵尸进程数
* **第三行：表示 CPU 状态信息**
  * 这里显示数据是所有 CPU 的平均值。多核 CPU 可以通过按 <kbd>1</kbd> 键来展开显示每个 CPU 状态
  * `4.3 us` - 用户空间占用 CPU 百分比
  * `1.4 sy` - 内核空间占用 CPU 百分比
  * `0.2 ni` - 用户进程空间内改变过优先级的进程占用 CPU 百分比
  * `93.3 id` - CPU 空闲率
  * `0.7 wa` - 等待 IO 的 CPU 时间百分比
  * `0.0 hi` - 硬中断（ Hardware IRQ ）占用 CPU 的百分比
  * `0.0 si` - 软中断（ Software Interrupts ）占用 CPU 的百分比
  * `0.0 st` - 这个虚拟机被 hypervisor 偷去的 CPU 时间（ 译注：如果当前处于一个 hypervisor 下的 vm，实际上 hypervisor 也是要消耗一部分 CPU 处理时间的 ）
* **第四行：物理内存使用信息**
  * `8055256 total` - 物理内存总量
  * `444928 free` - 使用的物理内存总量
  * `4203968 used`- 空闲内存总量
  * `3406360 buff/cache` - 用作内核缓冲 / 缓存的内存量
* **第五行：交换空间使用信息**
  * 我们要时刻监控交换分区的 used，如果这个数值在不断的变化，说明内核在不断进行内存和 swap 的数据交换，这是真正的内存不够用了
  * `8275964 total` - 交换区总量
  * ` 8273784 free` - 交换区空闲量
  * `2180 used` - 交换区使用量
  * `3538032 avail Mem` - 可用于进程下一次分配的物理内存数量
* **第六行：空行**
* **第七行：各个进程的状态信息**
  * `PID` - 进程 id
  * `USER` - 进程所有者
  * `PR` - 进程优先级
  * `NI` - nice 值；越小优先级越高，最小 -20，最大 20（ 用户设置最大 19 ）
  * `VIRT` - 进程使用的虚拟内存总量，单位 kb；VIRT=SWAP+RES
  * `RES ` - 进程使用的、未被换出的物理内存大小，单位 kb；RES=CODE+DATA
  * `SHR` - 共享内存大小，单位 kb
  * `S` - 进程状态；D = 不可中断的睡眠状态、R = 运行、S = 睡眠、T = 跟踪/停止、Z = 僵尸进程
  * `%CPU` - 上次更新到现在的 CPU 时间占用百分比
  * `%MEM` - 进程使用的物理内存百分比
  * `TIME+` - 进程使用的 CPU 时间总计
  * `COMMAND` - 命令名/命令行

### ps - report a snapshot of the current processes

* ps [options]
*

* ps命令支持三种使用的语法格式
  1. UNIX 风格，选项可以组合在一起，并且选项前必须有“-”连字符
  2. BSD 风格，选项可以组合在一起，但是选项前不能有“-”连字符
  3. GNU 风格的长选项，选项前有两个“-”连字符

**常用命令**

ps aux

ps -ef

ps axjf

ps axms

ps axZ

ps -U root -u root u


### lsof - list open files

* lsof   [ -?abChKlnNOPRtUvVX ] [ -A A ] [ -c c ] [ +c c ] [ +|-d d ] [ +|-D D ] [ +|-e s ] [ +|-E ] [ +|-f [cfgGn] ] [ -F [f] ] [ -g [s] ] [ -i [i] ] [ -k k ] [ +|-L [l] ] [ +|-m m ] [ +|-M ] [ -o [o] ] [ -p s ] [ +|-r [t[m<fmt>]] ] [ -s [p:s]  ]  [  -S  [t] ] [ -T [t] ] [ -u s ] [ +|-w ] [ -x [fl] ] [ -z [z] ] [ -Z [Z] ] [ -- ] [names]
* 常用选项
  * -a - 指示其它选项之间为与的关系
  * -c <进程名> 输出指定进程所打开的文件
  * -d <文件描述符> 列出占用该文件号的进程
  * +d <目录>  输出目录及目录下被打开的文件和目录(不递归)
  * +D <目录>  递归输出及目录下被打开的文件和目录
  * -i <条件>  输出符合条件与网络相关的文件
  * -n 不解析主机名
  * -p <进程号> 输出指定 PID 的进程所打开的文件
  * -P 不解析端口号
  * -t 只输出 PID
  * -u 输出指定用户打开的文件
  * -U 输出打开的 UNIX domain socket 文件
  * -h 显示帮助信息
  * -v 显示版本信息





