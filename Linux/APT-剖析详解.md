# APT 原理剖析、详解

> APT - Advanced Packaging Tool

<div align=center>
<img src="./images/软件安装方法历程.jpg" /></br>软件安装方法历程图
</div>

`/etc/apt/sources.list`只会告知系统可以访问的镜像站点地址，这时每当系统执行一次`sudo apt install xxx`都要链接镜像站检索出对应的软件地址，这样是很浪费时间的，所以在本地`/var/lib/apt/lists/`会缓存一份镜像站里的所有软件源信息，这样每次执行`sudo apt install xxx`直接在本地缓冲里检索，在连接网络下载文件。所以`sudo apt install`会先访问`/var/lib/apt/lists/`；而且`sudo apt update`更新的是`/var/lib/apt/lists/`里的软件源

## apt 基本命令

``` shell 
用法： apt [选项] 命令

命令行软件包管理器 apt 提供软件包搜索，管理和信息查询等功能。
它提供的功能与其他 APT 工具相同（像 apt-get 和 apt-cache），
但是默认情况下被设置得更适合交互。

常用命令：
  list - 根据名称列出软件包
  search - 搜索软件包描述
  show - 显示软件包细节
  install - 安装软件包
  remove - 移除软件包
  autoremove - 卸载所有自动安装且不再使用的软件包
  update - 更新可用软件包列表
  upgrade - 通过 安装/升级 软件来更新系统
  full-upgrade - 通过 卸载/安装/升级 来更新系统
  edit-sources - 编辑软件源信息文件
  
 您需要强制重新安装包，只需传递 --reinstall 标志即可(您将有效地强制重新安装包，即使它已经安装并且是最新版本。这将完全从系统*中删除包并重新安装它)
 $ sudo apt-get --reinstall install [package-name]
```

## ```sudo apt install xxx```

### 命令执行背后的故事

### 安装中下载的各种软件源文件、配置文件到哪里去了？

#### ```sudo apt install xxx```安装软件的各种文件主要分散到以下四个目录
* /usr/bin - 二进制文件
* /usr/lib - 动态函数库文件
* /usr/share/doc - 使用手册
* /usr/share/man - man page

> 所以在多用户情况下使用 `sudo apt install xxx`安装软件，会造成软件存放散乱，寻找软件配置文件麻烦；但 apt 安装软件系统会自动注册环境变量，且是全局的

#### 补充：源码安装软件应该把源码包放在 /usr/local


## `sudo apt update`

### 命令执行背后的故事

* 执行 `sudo apt update`
* 链接`/etc/apt/sources.list`里的软件源的镜像站，自动检索对比镜像站里的所有软件源与本地的`/var/lib/apt/lists/`目录，若发现有跟新，立即在`/var/lib/apt/lists/`目录里跟新
* 更新完毕

## `/var/lib/apt/lists`
使用 apt-get update 命令会从 /etc/apt/sources.list 中下载软件列表，并保存到该目录

## `/etc/apt/` 目录详解

<div align=center>
<img src="./images/etc-apt目录.jpg" /></br>/etc/apt 目录详解图
</div>

### `/etc/apt/sources.list` && `/etc/apt/sources.list.d/`

> 源和软件仓库实际上是一个意思，厂商将编译后的二进制文件和软件信息存放至服务器，用户需要安装软件时，包管理器自动分析本机和容器（repository）内的信息，下载需要的包并自动安装，安装后将新安装的软件信息存放至本地数据库。如果缺少软件依赖，rpm 或 dpkg 会提示安装失败，但也可以强制安装，yum 和 apt 会自动安装全部需要的依赖包

* Debian / Ubuntu 软件源的位置记录在 ```/etc/apt/sources.list```

``` shell
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ bionic restricted universe multiverse main #Added by software-properties
......
```
* 每行的第一个单词 deb 或 deb-src，描述了文件类型，目录中包含的是二进制软件包（deb），即我们通常使用的已编译好的软件包；或包含的是源码包（ deb-src ），源码包包含源程序编码、Debian管理文件（.dsc）和 “Debian化” 该程序所做更改的记录文件 diff.gz
* /etc/apt/sources.list文件可包含多种类型的地址，APT知道如何处理这些不同的地址类型：http，ftp，file（本地文件，例如：一个加载了ISO9600文件系统的目录）和ssh

### `/etc/apt/apt.conf` && `/etc/apt/apt.conf.d/`

## `/var/lib/dpkg/available`
文件的内容是软件包的描述信息，该软件包括当前系统所使用的安装源中的所有软件包，其中包括当前系统中已安装的和未安装的软件包


## `/var/cache/apt/archives` 
`$ sudo apt-get clean`清空此目录
APT缓存文件，目录是在用 apt-get install 安装软件时，软件包的临时存放路径

## `sudo apt autoremove`
autoclean是另一种方法，用于清除下载的包文件的本地存储库，clean和之间的区别在于autoclean后者仅删除无法再从其源下载的包文件，并且很可能无用

/etc/apt/sources.list
存放的是软件源站点, 当你执行 sudo apt-get install xxx 时，Ubuntu 就去这些站点下载软件包到本地并执行安装





每当执行命令进行软件的安装或着更新，或者软件源的更新时，apt会访问/etc/apt/sources.list内的地址，并在该网站中找到对应系统的包信息例如我的操作系统是ubuntu，网站是deb http://mirrors.163.com/ubuntu/ precise main restricted universe multiverse网易的，那么当我们执行安装的命令时，他就会对应的访问http://mirrors.163.com/ubuntu/dists/lucid/main/binary-i386/的packages.gz，这个文件是服务器上软件包及其依赖关系的清单，并且用gzip压缩过了。apt-get update使用这个清单来确定能够获得哪些补充的软件包且他的内容会被保存在/var/lib/apt/lists内，通过访问这个lists确定该软件是否已安装，是否是最新版本，依赖关系是否满足，从而确定要更新内容，并进行更新，其安装过程主要是由dpkg来完成
