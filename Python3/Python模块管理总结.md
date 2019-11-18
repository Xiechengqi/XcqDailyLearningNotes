# Python 模块管理总结

> * 一般安装尝试步骤：<kbd>**pip**</kbd> -> <kbd>**easy_install**</kbd> - > <kbd>**setup.py**</kbd>

* pip
* easy_install
* setup.py



## `setup.py` 管理源码安装的 Python 模块

### 一、安装

1. 在 [PyPI](https://pypi.org/) 或 [Github](https://www.github.com) 上下载以 `.tar.gz` 或 `.zip` 格式的 Python 模块源码包
2. 解压源码包并进入解压包目录
3. `python3 setup.py install` 安装

### 二、卸载

> 源码安装的 Python 模块，只需手动删除所有安装的模块即可，但问题往往是找不到安装了哪些模块

* 可以在安装时使用 `python3 setup.py install --record log` ，这样 log 文件里就记录了安装的文件路径，需要卸载时，只需执行 `cat log ｜ xagrs rm -rf`

### 三、常用命令

* <kbd>**python3 setup.py -h**</kbd> - 查看帮助
* <kbd>**python3 setup.py install**</kbd> - 安装
* <kbd>**python3 setup.py build**</kbd> - 编译模块，生成文件放在 `./build/` 目录下
* <kbd>**python3 setup.py --url**</kbd> - 输出本模块的 url

## pip 安装 Python 模块



