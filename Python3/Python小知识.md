# Python 学习遇到的问题解决或扩展小知识

## 目录

* [pip设置默认镜像源](#pip设置默认镜像源-top)

* [`# -*- coding: UTF-8 -*-`和`#coding=utf-8`中文编码问题](#----coding-utf-8---和codingutf-8中文编码问题-top)
* [列表特性 - 就地修改和有无返回值](#列表特性---就地修改和有无返回值-top)

## pip设置默认镜像源 [[Top]](#目录)

``` bash
# mac Linux 
# 修改 ~/.pip/pip.conf (没有就创建一个)， 内容如下：
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple

# windows: 
# 直接在 user 目录中创建一个 pip 目录，如：C:\Users\xx\pip，新建文件pip.ini，内容如下
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple

豆瓣：https://pypi.douban.com/simple/
阿里云：https://mirrors.aliyun.com/pypi/simple/
中国科技大学：https://pypi.mirrors.ustc.edu.cn/simple/
清华大学：https://pypi.tuna.tsinghua.edu.cn/simple/
```


## `# -*- coding: UTF-8 -*-`和`#coding=utf-8`中文编码问题 [[Top]](#目录)

Python 中默认的编码格式是 ASCII 格式，在没修改编码格式时无法正确打印汉字，所以在读取中文时会报错

解决方法为只要在文件开头加入 `# -*- coding: UTF-8 -*-` 或者 `#coding=utf-8` 就行了

> 注意：`#coding=utf-8` 的 = 号两边不要空格。

## 列表特性 - 就地修改和有无返回值 [【Top】](#目录)

|  | `list(lst)` | `del lst[x]` | `lst.append(o)` | `lst.clear() ` | `lst1.extend(lst2)` | `lst.insert(x,o)` | `lst.pop()` | `lst.remove(o)` | `lst.reverse()` | `lst.sort()` | `sorted(lst)` |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 就地修改 | :x: |  :heavy_check_mark: |  :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :x: |
| 返回值 | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: | :heavy_check_mark: | :x: | :x: | :x: | :heavy_check_mark: |

> * `lst`：列表
> * `x`：元素索引
> * `0`：对象
