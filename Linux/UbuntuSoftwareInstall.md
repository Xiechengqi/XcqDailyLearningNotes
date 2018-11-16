# Ubuntu 软件包安装

## 源码包

1. 安装编译工具：$ sudo apt-get install build-essential
* 在ubuntu上编译程序，默认是有gcc的，但是没有g++。如果自己来安装g++也可以，不过它涉及到一些依赖库，有点麻烦，但 build-essential 包里有很多开发必备的软件包：dpkg-dev fakeroot g++ g++-4.6 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libdpkg-perl libstdc++6-4.6-dev libtimedate-perl
* 推荐将源码包放在/usr/local/src目录下
2. 进入/usr/local/src目录，解压源码包，进入源码目录
3. 编译、安装软件
* 一般情况下，里面有个configure文件，则运行命令:
```shell
sudo ./configure —prefix=/usr/local/filename/  #存放路径，可更改
make    #编译
sudo make install #安装
```
* 如果只有Makefile文件，则运行命令：
```shell
make    #编译
sudo make install #安装
```
* 如果只是Imake文件，则运行命令：
```shell
xmkmf  #配置
make  #编译
sudo make install   # 安装
```
4. 卸载软件：$ dpkg -r filename.deb
5. 清除编译过程中产生的临时文件：$ make clean
6. 清除配置过程中产生的文件：$ make distclean (谨用)
7. 卸载软件时，进入源码文件目录：$ make uninstall

## deb包

方法一、 使用dpkg软件管理系统双击直接安装
方法二、 命令行安装
```shell
sudo apt-get install dpkg   #先安装dpkg
dpkg -i filename.deb  #安装软件
dpkg -r filename.deb   #卸载
```
## rpm包
方法一、 先用alien命令把 RPM 包转换为 Deb 软件包，再安装即可
```shell
sudo apt install alien      #安装alien
alien -d filename.rpm       #使用alien将rpm包转换为deb包
sudo dpkg -i filename.deb   #安装
sudo dpkg -r filename.deb   #卸载
```
方法二、 使用 rpm 命令直接安装
```shell
sudo apt install rpm        #安装 rpm
./alien -i filename.rpm
```

##　bin 包
```shell
sudo chmod a+x filename.bin   #更改执行权限
./filename.bin   #安装
```

## sh 包或 bash 包
```shell
sudo chmod a+x filename.sh filename.bash       # 更改权限
./filename.sh (或 $ ./filename.bash)           #安装软件
```

## 二进制包
* 不用安装，将软件放于某目录下。
* 直接运行软件：```$ ./filename```

## py 包
```shell
sudo apt-get install python    #安装python
python filename.py             #安装软件
```

## pl 包
```shell
sudo apt-get install perl    #安装perl
perl filename.pl             #安装软件
```
