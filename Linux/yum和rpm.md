## Yum 和 RPM

RedHat 系列软件安装大致可以分为两种：

- rpm 文件安装 - 使用 rpm 指令 类似 [ubuntu] deb 文件安装，使用 dpkg指令
- yum 安装 - 类似 [ubuntu] apt 安装

## RPM

### rpm 包命名规范

* <kbd>**包名**</kbd>-<kbd>**版本信息**</kbd>-<kbd>**发布版本号**</kbd>.<kbd>**运行平台**</kbd>

* ```bash
  zabbix-agent-4.4.0-1.el7.x86_64.rpm 
  zabbix-release-4.4-1.el7.noarch.rpm   # noarch 代表的是软件可以平台兼容
  ```

### 常用命令

* <kbd>**查看已安装软件信息**</kbd>
  * <kbd>**rpm -qa**</kbd> - 查看系统中已经安装的软件
  * <kbd>**rpm -qf \[文件绝对路径\]**</kbd> - 查看一个已经安装的文件属于哪个软件包
  * <kbd>**rpm -ql \[软件名\]**</kbd> - 查看已安装软件包的安装路径，`[软件名]` 是 rpm 包去除平台信息和后缀后的信息
  * <kbd>**rpm -qi [软件名]**</kbd> - 查看已安装软件包的信息
  * <kbd>**rpm -qc [软件名]**</kbd> - 查看已安装软件的配置文件
  * <kbd>**rpm -qd [软件名]**</kbd> - 查看已经安装软件的文档安装位置
  * <kbd>**rpm -qR [软件名]**</kbd> - 查看已安装软件所依赖的软件包及文件

* <kbd>**查看未安装软件信息**</kbd> 
  * <kbd>**rpm -qpi [rpm文件]**</kbd> - 查看软件包的用途、版本等信息
  * <kbd>**rpm -qpl [rpm文件]**</kbd> - 查看软件包所包含的文件
  * <kbd>**rpm -qpc [rpm文件]**</kbd> - 查看软件包的配置文件
  * <kbd>**rpm -qpR [rpm文件]**</kbd> - 查看软件包的依赖关系
* <kbd>**软件包的安装、升级、删除等**</kbd> - 
  * <kbd>**rpm -ivh [rpm文件]**</kbd> - 安装
  * <kbd>**rpm -Uvh [rpm文件]**</kbd> - 升级
  * <kbd>**rpm -e [软件名]**</kbd> - 删除
  * <kbd>**rpm -e [软件名] --nodeps**</kbd> - 不管依赖问题，强制删除软件
  * <kbd>**rpm --import [签名文件]**</kbd> - 导入签名

## YUM

* yum 可以更方便的添加、删除、更新 RPM 包，并且能自动解决包的倚赖问题

<kbd>**rpm -ivh https://opsx.alibaba.com/mirror/detail/1859610790?lang=zh-CN**</kbd> - 安装 yum 	

<kbd>**yum check-update**</kbd> - 检查可以更新的软件包 

<kbd>**yum -y update**</kbd> - 升级所有包同时也升级软件和系统内核

<kbd>**yum -y upgrade**</kbd> - 只升级所有包，不升级软件和系统内核

<kbd>**yum update [软件名]**</kbd> - 更新特定的软件包 

<kbd>**yum install [rpm文件]**</kbd> - 安装 rpm 包

<kbd>**yum remove [rpm文件]**</kbd> - 删除 rpm 包

<kbd>**yum clean all**</kbd> - 清除缓存中旧的 rpm 头文件和包文件 

<kbd>**yum clean packages**</kbd> - 清楚缓存中 rpm 包文件

<kbd>**yum clean  headers**</kbd> - 清楚缓存中 rpm 的头文件

<kbd>**yum clean old headers**</kbd> - 清除缓存中旧的头文件 

<kbd>**yum list**</kbd> - 列出资源库中所有可以安装或更新的 rpm 包

<kbd>**yum list google***</kbd> - 可以在 rpm 包名中使用通配符,查询类似的 rpm 包

<kbd>**yum list updates**</kbd> - 列出资源库中所有可以更新的 rpm 包 

<kbd>**yum list installed**</kbd> - 列出已经安装的所有的 rpm 包 

<kbd>**yum list extras**</kbd> - 列出已经安装的但是不包含在资源库中的 rpm 包 

<kbd>**yum info** </kbd> - 列出资源库中所有可以安装或更新的 rpm 包的信息

<kbd>**yum info google***</kbd> - 列出资源库中特定的可以安装或更新以及已经安装的  rpm 包的信息

<kbd>**yum info updates**</kbd> - 列出资源库中所有可以更新的 rpm 包的信息 

<kbd>**yum info installed**</kbd> - 列出已经安装的所有的 rpm 包的信息 

<kbd>**yum info extras**</kbd> - 列出已经安装的但是不包含在资源库中的 rpm 包的信息 

<kbd>**yum search google**</kbd> - 搜索匹配特定字符的 rpm 包

<kbd>**yum provides google**</kbd> - 搜索包含特定文件的 rpm 包

