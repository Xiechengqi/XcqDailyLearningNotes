## Terminfo简介
https://www.tldp.org/HOWTO/Text-Terminal-HOWTO-16.html

Terminfo（以前称为 Termcap ）是终端功能和其他内容的数据库。对于终端的每个（差不多）模型，它告诉应用程序终端能够做什么。它告诉发送到终端的转义序列（或控制字符），以便执行诸如将光标移动到新位置，擦除屏幕的一部分，滚动屏幕，更改模式，更改外观（颜色，亮度，闪烁，下划线，反向视频等）。大约在1980年之后，许多终端支持了一百多种不同的命令（其中一些命令采用数字参数）。

terminfo将其信息提供给应用程序的一种方式是通过程序员可以放入C程序的“ncurses”函数。例如，如果程序想要将光标移动到第3行，则第6列只需调用：move（3,6）。move（）函数（ncurses的一部分）知道如何为终端执行此操作（它已读取terminfo）。因此，它将适当的转义序列发送到终端，以便为特定终端进行此特定移动。有些程序直接从terminfo文件获取信息而不使用ncurses。因此，不需要ncurses的Linux软件包可能仍需要终端的terminfo文件。

terminfo缩写通常比termcap的缩写长，因此更容易猜出它们的含义。terminfo的手册页更详细（包括旧的termcap缩写）。此外，termcap条目具有sizefo的大小限制。因此，除非您已经承诺使用termcap，否则建议您使用terminfo。



> **ncurses will search ${HOME}/.terminfo first, then /etc/terminfo (this directory), then /lib/terminfo, and last not least /usr/share/terminfo.**

## ~/.terminfo

``` shell
xcq@xcq-HP-Pavilion-Notebook:~$ ls -l .terminfo
ls: 无法访问'.terminfo': 没有那个文件或目录
```

## /etc/terminfo/

``` shell
xcq@xcq-HP-Pavilion-Notebook:/etc/terminfo$ ls -a
.  ..  README
xcq@xcq-HP-Pavilion-Notebook:/lib/terminfo$ cat /etc/terminfo/README 
This directory is for system-local terminfo descriptions. By default,
ncurses will search ${HOME}/.terminfo first, then /etc/terminfo (this
directory), then /lib/terminfo, and last not least /usr/share/terminfo.
```

## /lib/terminfo/

``` shell
xcq@xcq-HP-Pavilion-Notebook:/lib/terminfo$ ls -al 
总用量 60
drwxr-xr-x 15 root root 4096 Feb 19  2016 .
drwxr-xr-x 23 root root 4096 Apr 25  2018 ..
drwxr-xr-x  2 root root 4096 Jun  9 15:28 a
drwxr-xr-x  2 root root 4096 Jun  9 15:28 c
drwxr-xr-x  2 root root 4096 Jun  9 15:28 d
drwxr-xr-x  2 root root 4096 Jun  9 15:28 E
drwxr-xr-x  2 root root 4096 Jun  9 15:28 h
drwxr-xr-x  2 root root 4096 Jun  9 15:28 l
drwxr-xr-x  2 root root 4096 Jun  9 15:28 m
drwxr-xr-x  2 root root 4096 Jun  9 15:28 p
drwxr-xr-x  2 root root 4096 Jun  9 15:28 r
drwxr-xr-x  2 root root 4096 Jun  9 15:28 s
drwxr-xr-x  2 root root 4096 Jun  9 15:28 v
drwxr-xr-x  2 root root 4096 Jun  9 15:28 w
drwxr-xr-x  2 root root 4096 Jun  9 15:28 x
```

## /usr/share/terminfo

``` shell
xcq@xcq-HP-Pavilion-Notebook:/usr/share$ ls -al terminfo
总用量 16
drwxr-xr-x   2 root root  4096 Feb 19  2016 .
drwxr-xr-x 370 root root 12288 Dec  6 21:16 ..
```

