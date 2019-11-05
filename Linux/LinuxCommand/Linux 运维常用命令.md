# Linux 运维常用命令查询

> * Ubuntu 18.04 LTS

<div align=center>
<img src="../images/运维基本命令.jpg" /></br>Linux 运维常用命令
</div>

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
* [选项]  ( [参数] )
  * <kbd>-b</kbd> - 批处理
  * <kbd>-c</kbd> - 显示进程的命令行参数 ( 默认只有进程名 )
  * <kbd>-I</kbd> - 忽略失效过程
  * <kbd>-s</kbd> - 保密模式
  * <kbd>-S</kbd> - 累积模式
  * <kbd>-d<时间></kbd> - 设置更新间隔时间
  * <kbd>-u<用户名></kbd> - 指定用户名
  * <kbd>-p<进程号></kbd> - 指定进程
  * <kbd>-n<次数></kbd> - 循环显示的次数
  
### 常用命令
```
top         #显示系统进程信息
top -b      #以批处理模式显示程序信息
top -S      #以累积模式显示程序信息
top -n 2   #设置信息更新次数,表示更新 2 次后终止更新显示
top -d -3   #设置信息更新时间,表示更新周期为 3 秒
top -p 1138  #显示进程号为1138 的进程信息，CPU、内存占用率等
```

### 使用技巧

* 进程字段排序
  * 默认进入 top 时，各进程是按照 CPU 的占用量来排序的。但是，我们可以改变这种排序：
  * M：根据驻留内存大小进行排序
  * P：根据 CPU 使用百分比大小进行排序
  * T：根据时间 / 累计时间进行排序
* 多核 CPU 监控
  * 在 top 基本视图中，第三行表示 CPU 状态信息；这里显示数据是所有 CPU 的平均值，多核 CPU 可以通过按 <kbd>1</kbd> 键来展开显示每个 CPU 状态

### 命令输出详解

<kbd>**top**</top>

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
  
  
## ip - show / manipulate routing, network devices, interfaces and tunnels

* <kbd>ip [选项] 对象 { 命令 | help }</kbd>
* 常用对象
  * <kbd>link</kbd> - 网络设备
  * <kbd>address</kbd> - 设备上的协议（ IP 或 IPv6 ）地址
  * <kbd>addrlabel</kbd> - 协议地址选择的标签配置
  * <kbd>route</kbd> - 路由表条目
  * <kbd>rule</kbd> - 路由策略数据库中的规则
  
* 常用选项
  * <kbd>-V，-Version</kbd> - 显示指令版本信息
  * <kbd>-s，-stats，statistics</kbd> - 输出详细信息
  * <kbd>-h，-human，-human-readable</kbd> - 输出人类可读的统计信息和后缀
  * <kbd>-o，-oneline</kbd> - 将每条记录输出到一行，用 `\` 字符替换换行符
 
### 常用命令

``` shell
                                                                       # ip address - 设定与 IP 有关的各项参数，包括 netmask， broadcast 等
                                                                       
ip addr show                             # 显示网卡及配置的地址信息，也可用 ip a s 或 ip a
# ip address [add|del] [IP参数] [dev 设备名] [相关参数]
# [add|del]：进行相关参数的增加(add)或删除(del)设定
# [IP 参数] ：主要就是网域的设定，例如 192.168.100.100/24 之类的设定
# [dev 设备名]：IP 参数所要设定的设备，例如eth0, eth1等
# [相关参数]：
          # broadcast：设定广播位址，如果设定值是 + 表示让系统自动计算
          # label：该设备的别名，例如eth0:0
          # scope：这个设备的领域，默认global，通常是以下几个大类
                    # global：允许来自所有来源的连线
                    # site：仅支持IPv6 ，仅允许本主机的连接
                    # link：仅允许本设备自我连接
                    # host：仅允许本主机内部的连接          
ip addr add 192.168.0.50/255.255.255.0 dev eth0       # 为网卡分配 IP 地址以及其他网络信息
ip addr add broadcast 192.168.0.255 dev eth0             # 设置广播地址
ip addr add 192.168.0.20/24 dev eth0 label eth0:1     # 添加 eth0 网卡别名
ip addr del 192.168.0.10/24 dev eth0                                # 删除网卡中配置的 IP 地址


# ip link - 可以操作与设备( device )有关的相关设定，包括 MTU 以及该网络设备的 MAC 等，也可以启动 ( up ) 或关闭 ( down ) 某个网络设备

ip -s link                                      # 显示所有网络接口的统计数据
ip link set eth0 up                   # 启用网卡名为 etho0 的网卡
ip link set eth0 down             # 禁用网卡
ip link set eth0 mtu 1000     # 更改 MTU 为 1000 bytes
ip link set ent0 name eth1  # 更改网卡名字


                                  # ip route -  路由配置,功能几乎与 route 这个命令一样，但是，它还可以进行额外的参数设置
                                  
ip route show                            # 查看路由信息，也可用 ip r s 或 ip r
ip route get 119.75.216.20   # 通过 IP 地址查询路由包从哪条路由来
# ip route [add|del] [IP或网域] [via gateway] [dev 设备]
          # [add|del]：增加 ( add ) 或删除 ( del ) 路由
          # [IP或网域]：可使用 192.168.50.0/24 之类的网域或者是单纯的 IP 
          # [via gateway]：从哪个 gateway 出去，不一定需要
          # [dev 设备名]：所要设定的设备，例如 eth0, eth1 等
ip route add default via 192.168.0.150/24                          #  修改当前默认路由为 192.168.0.150
ip route add 172.16.32.32 via 192.168.0.150/24 dev eth0          # 添加特定网卡的路由，增加通往外部路由
ip route del 192.168.0.150/24                   # 删除路由
ip route flush cache                # 刷新路由表


# 检查所有的 ARP 记录
ip neigh

```

### 命令输出详解

<kbd>ip address</kbd>

``` shell
ip address
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 00:1e:4f:c8:43:fc brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.24/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
  3: wlo1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether a4:02:b9:54:3f:80 brd ff:ff:ff:ff:ff:ff
    inet 192.168.158.164/21 brd 192.168.159.255 scope global dynamic noprefixroute wlo1
       valid_lft 3378sec preferred_lft 3378sec
    inet6 fe80::1b3d:9f06:efac:3878/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
 ```
* 系统有三个接口：lo 、eth0 和 wlo1，lo 是环回接口，eth0 这个普通网络接口，wlo1 是 wifi 接口
  * <kbd> <BROADCAST,MULTICAST,UP,LOWER_UP></kbd> 
    * <kbd>BROADCAST</kbd> - 表示该接口支持广播
    * <kbd>MULTICAST</kbd> - 表示该接口支持多播
    * <kbd>UP</kbd> - 表示该网络接口已启用
    * <kbd>LOWER_UP</kbd> - 表示网络电缆已插入，设备已连接至网络
 * <kbd>mtu 1500</kbd> - 最大传输单位（ 数据包大小 ）为 1500 字节
 * <kbd>qdisc pfifo_fast</kbd> - 用于数据包排队
 * <kbd>state UP</kbd> - 网络接口已启用
 * <kbd>qlen 1000</kbd> - 传输队列长度
 * <kbd>link/ether 00:1e:4f:c8:43:fc</kbd> - 接口的 MAC（ 硬件 ）地址
 * <kbd>brd ff:ff:ff:ff:ff:ff</kbd> - 广播地址
 * <kbd>inet 192.168.0.24/24</kbd> - IPv4 地址
 * <kbd>brd 192.168.0.255</kbd> - 广播地址
 * <kbd>scope global</kbd> - 全局有效
 * <kbd>dynamic noprefixroute wlo1</kbd> - 地址是动态分配的
 * <kbd>valid_lft forever</kbd> - IPv4 地址的有效使用期限
 * <kbd>preferred_lft 3378sec</kbd> - IPv4 地址的首选生存期
 * <kbd>inet6 fe80::1b3d:9f06:efac:3878/64</kbd> - IPv6 地址
 * <kbd>scope link</kbd> - 仅在此设备上有效
 * <kbd>valid_lft forever</kbd> - IPv6 地址的有效使用期限
 * <kbd>preferred_lft forever</kbd> - IPv6 地址的首选生存期
 
 <kbd>ip route</kbd>
 
 ```shell
 ip route
 default via 192.168.152.1 dev wlo1 proto dhcp metric 600 
169.254.0.0/16 dev wlo1 scope link metric 1000 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
192.168.152.0/21 dev wlo1 proto kernel scope link src 192.168.158.164 metric 600
 ```
 
* 第一条是默认的路由，我们可以根据我们的需要改动它
* <kbd>metric 1002</kbd> - 跳跃计数，确定网关的优先级，默认 20，数值越小优先级越高
* <kbd>proto kernel</kbd> - 该路由的协议，主要有 redirect，kernel，boot，static，ra 等，其中 kernel 指的是直接由核心判断自动设定

<kbd>ip -s link</kbd>

``` shell
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    RX: bytes  packets  errors  dropped overrun mcast   
    12421814   19572    0       0       0       0       
    TX: bytes  packets  errors  dropped carrier collsns 
    12421814   19572    0       0       0       0       
2: eno1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether ec:8e:b5:44:4a:1c brd ff:ff:ff:ff:ff:ff
    RX: bytes  packets  errors  dropped overrun mcast   
    0          0        0       0       0       0       
    TX: bytes  packets  errors  dropped carrier collsns 
    0          0        0       0       0       0 
3: wlo1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DORMANT group default qlen 1000
    link/ether a4:02:b9:54:3f:80 brd ff:ff:ff:ff:ff:ff
    RX: bytes  packets  errors  dropped overrun mcast   
    429373334  837924   0       0       0       0       
    TX: bytes  packets  errors  dropped carrier collsns 
    23895841   143531   0       0       0       0
```

<kbd>ip -s -s link eno1</kbd>

``` shell
2: eno1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether ec:8e:b5:44:4a:1c brd ff:ff:ff:ff:ff:ff
    RX: bytes  packets  errors  dropped overrun mcast   
    0          0        0       0       0       0       
    RX errors: length   crc     frame   fifo    missed
               0        0       0       0       0       
    TX: bytes  packets  errors  dropped carrier collsns 
    0          0        0       0       0       0       
    TX errors: aborted  fifo   window heartbeat transns
               0        0       0       0       1  
   ```

* <kbd>RX</kbd> - 表示接收
* <kbd>TX</kbd> - 表示发送
* <kbd>bytes</kbd> - 接收/发送的字节数
* <kbd>packets</kbd> - 接收/发送的包数
* <kbd>errors</kbd> - 接收/发送的带有错误的包总数
* <kbd>dropped</kbd> - 由于处理资源不足导致接收/发送的丢弃的包数
* <kbd>overrun</kbd> - 因接收溢出（ 环形缓冲区 ）导致丢失的包；通常如果接口溢出，则表示内核中存在严重问题，或者说服务器上该网络设备的处理设备太慢
* <kbd>mcast</kbd> - 接收到的多播包数
* <kbd>carrier</kbd> - 因数据链路错误导致发送失败的包数
* <kbd>collsns</kbd> - 因在网络上发送冲突而导致的失败数


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





