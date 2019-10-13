# Linux 开机启动项详解

## 一、开机启动相关文件

### `/etc/rc[0-6].d`目录

<div align=center>
<img src="/Linux/images/rc06.jpg"><br/>
/etc/rcx.d
</div>

> 目录下文件的命名规则：**S|K + nn + script**

<div align=center>
<img src="/Linux/images/rc0.jpg"><br/>
/etc/rc0.d 目录下文件
</div>

* 0 - 6 是 Linux 操作系统的运行级别，运行 runlevel 查看当前运行级

| 运行级别 | 说明 |
| :---: | --- |
| 0 | 系统停机状态，系统默认运行级别不能设为0，否则不能正常启动 |
| 1 | 单用户工作状态，root权限用户，用于系统维护，禁止远程登陆 |
| 2 | 多用户状态(没有NFS) |
| 3 | 完全的多用户状态(有NFS)，登陆后进入控制台命令行模式 |
| 4 | 系统未使用，保留 |
| 5 | X11控制台，登陆后进入图形GUI模式 |
| 6 | 系统正常关闭并重启，默认运行级别不能设为6，否则不能正常启动 |

* S | K：S 开头命名的是开机要执行的脚本，K 开头命名的是关机要执行的脚本
* nn：取值 0 - 100，表示优先级，数字越大，优先级越低
* script：软链接指向的脚本的文件名

## 二、设置开机启动方法

### 1. 编辑`/etc/rc.local`文件

> 没有的话自己创建

``` shell
#!/bin/sh
#
# This script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.

touch /var/lock/subsys/local
/etc/init.d/mysqld start  #mysql开机启动
/etc/init.d/nginx start  #nginx开机启动
/etc/init.d/php-fpm start  #php-fpm开机启动
/etc/init.d/memcached start   #memcache开机启动

#在文件末尾（exit 0之前）加上你开机需要启动的程序或执行的命令即可（执行的程序需要写绝对路径，添加到系统环境变量的除外），如：

/usr/local/thttpd/sbin/thttpd  -C /usr/local/thttpd/etc/thttpd.conf
```

### 2. 使用 chkconfig \ systemctl 命令

> 早期的 Linux 版本是用 chkconfig 命令来设置 rc 的 link，设置开机启动项；用 service 命令调用服务的 start、stop、restart、status 等函数。在现在主流 Linux 版本已经将这两个命令合并成一个 systemctl 命令了，映射关系如下:

| 任务 | 旧指令 ( chkconfig、service ) | 新指令 ( systemctl ) |
| --- | --- | --- |
| 设置服务开机自启 | chkconfig --level 3 httpd on | systemctl enable httpd.service |
| 禁止服务开机自启 | chkconfig --level 3 httpd off | systemctl disable httpd.service |
| 查看服务状态 | service httpd status | systemctl status httpd.service |
| 显示所有开机启动服务 | chkconfig --list | systemctl list-units --type=service |
| 显示当前已启动的开机启动服务 | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;--- | systemctl list-units &#124; grep enable |
| 显示当前已启动的开机启动文件 | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;--- | systemctl list-files &#124; grep enable |
| 显示启动失败的开机启动服务 | --- | systemctl --failed |
| 启动服务 | service httpd start | systemctl start httpd.service |
| 关闭服务 | service httpd stop | systemctl stop httpd.service |
| 重启服务 | service httpd restart | systemctl restart httpd.service |

### 3. 自己写一个shell脚本

将写好的脚本（ .sh 文件）放到目录 `/etc/profile.d/` 下，系统启动后就会自动执行该目录下的所有 shell 脚本。

<div align=center>
<img src="/Linux/images/profiled.jpg"><br/>
/etc/profile.d 文件夹中文件
</div>

### 4. 添加一个开机启动服务

将你的启动脚本复制到` /etc/init.d`目录下，并设置脚本权限, 假设脚本为 test

``` bash
$ mv test /etc/init.d/test
$ sudo chmod 755 /etc/init.d/test
```

> * `/etc/init.d` 目录下的控制脚本接受参数 start | stop | restart | status | force-reload

将该脚本放倒启动列表中去
```
$ cd .etc/init.d
$ sudo update-rc.d test defaults 95
```
> * 其中数字 95 是脚本启动的顺序号，按照自己的需要相应修改即可。在你有多个启动脚本，而它们之间又有先后启动的依赖关系时你就知道这个数字的具体作用了。

**update-rc.d**  命令 : 为`/etc/init.d`目录下的脚本建立或删除到`/etc/rc[0-6].d`的软链接

> update-rc.d 命令要在 `etc/init.d/` 目录下执行，可能还需要 root 权限
* 增加一个服务
  * 添加这个服务并让它开机自动执行 : update-rc.d apache2 defaults
    * 并且可以指定该服务的启动顺序 : update-rc.d apache2 defaults 90
    * 还可以更详细的控制start与kill顺序 : update-rc.d apache2 defaults 20 80
    * 其中前面的 20 是 start 时的运行顺序级别，80 为 kill 时的级别。也可以写成 : update-rc.d apache2 start 20 2 3 4 5 . stop 80 0 1 6 .(其中 0 ～ 6 为运行级别)
* 删除一个服务
  * update-rc.d -f apache2 remove
