# Vim 编辑器再学习

> 使用 Ubuntu 已经两年了，对于 Vim 的利用只能算是小半桶水水平，一直感觉利用 Vim 编程非常麻烦，几次尝试系统学习 Vim，并从此转换到 Vim 使用者一族，但都半途而废。现在终于下定决心，即使摸着石头也要过了这条 “河”。我认为这就好比当年从 Windows 迁移到 Linux 上，一开始一直犹犹豫豫，但后来看到一片令我茅塞顿开的文章，那天下午我就开始了 Linux 的生涯，凡事都要迈出第一步嘛！

## Vim 安装、卸载

> **Vim Github :** https://github.com/vim/vim

### 安装方法

> 安装很简单，方法如下，具体步骤百度、Google 一下即可

1. Github 源码安装
2. 本地软件源安装：`sudo apt install vim`
3. 添加软件源安装

### 卸载

> 卸载有些地方需要注意

1. 老版本 Vim 完全卸载

* 首先检查本地安装的 Vim 相关的软件

``` shell
dpkg -l | grep vim
```

* apt 卸载

``` shell
sudo apt-get remove vim
sudo apt-get remove vim-runtime
sudo apt-get remove vim -tiny
sudo apt-get remove vim-common
sudo apt-get remove vim-doc
sudo apt-get remove vim-scripts
```

2. 使用包管理器 apt 卸载

``` shell
# 卸载 Vim，只删除 Vim 包本身
sudo apt remove vim
# 卸载 Vim 及其依赖软件包
sudo apt remove --auto-remove vim
# 清除 Vim 配置/数据，注意清除的配置及数据无法恢复
sudo apt purge vim
# &
sudo apt purge --auto-remove vim
```

## Vim 的配置

### Vim 配置文件 - `vimrc`

1. 系统级 Vim 配置文件

* `/etc/vim/vimrc`
系统的每个用户在打开 Vim 时都会载入它
* `/usr/share/vim/vimrc`
是一个链接到 `/etc/vim/vimrc` 的链接文件
``` shell
lrwxrwxrwx 1 root root 14 Apr 11  2018 vimrc -> /etc/vim/vimrc
```
2. 用户级 Vim 配置文件

* `~/.vimrc
应该在这里编辑自己的 Vim 配置信息

### vimrc 文件编辑

> 常规的 set 之类自行百度、Google 很容易，记录一些**奇淫技巧**

* 要让.vimrc变更内容生效，一般的做法是先保存 .vimrc 再重启 vim，增加如下设置，可以实现保存 .vimrc 时自动重启加载
``` shell
autocmd BufWritePost $MYVIMRC source $MYVIMRC
```




