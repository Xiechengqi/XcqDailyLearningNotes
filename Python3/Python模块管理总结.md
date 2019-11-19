# Python 模块管理总结

> * 一般安装尝试步骤：<kbd>**pip**</kbd> -> <kbd>**easy_install**</kbd> - > <kbd>**setup.py**</kbd>

* pip - <kbd>在线安装</kbd> <kbd>离线安装</kbd>
* easy_install - <kbd></kbd> <kbd></kbd>
* setup.py - <kbd>离线安装</kbd>



## `setup.py` 管理源码安装的 Python 模块

### 一、离线安装

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
* <kbd>**python setup.py sdist**</kbd> - 发布一个 python 模块，将其打包成 tar.gz 或者 zip 压缩包
* <kbd>**python setup.py bdist_rpm**</kbd> - 打包成 rpm 安装包
* <kbd>**python setup.py bdist_wininst**</kbd> - 打包成 exe 安装包
* <kbd>****</kbd> - 

## pip 安装 Python 模块

### 一、安装

<kbd>**在线安装**</kbd>

1. 安装 pip3

```bash
# python3 安装时就自带了 pip 和 pip3，只需 yum update 即可
# yum
$ yum -y install epel-release
$ yum install python36-pip
$ pip install --upgrade pip
# easy_install
$ yum install -y python-setuptools
$ easy_install pip
```

2. 配置 pip 国内镜像源

``` bash
$ pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# 豆瓣：https://pypi.douban.com/simple/
# 阿里云：https://mirrors.aliyun.com/pypi/simple/
# 中国科技大学：https://pypi.mirrors.ustc.edu.cn/simple/
# 清华大学：https://pypi.tuna.tsinghua.edu.cn/simple/
```

3. 安装

``` bash
# 搜索 PyPI 是否存在 numpy
$ pip search numpy
# 搜索 numpy 的版本
$ pip install numpy==
# 安装 
$ pip install numpy==1.17.3
```

<kbd>**离线安装**</kbd>

1. 安装 pip
2. 下载模块 wheel 包(whl 包)

![python_whl](./images/python_whl.png)

3. 安装

``` bash
$ pip install [路径]/pandas-0.24.2-cp36-cp36m-win32.whl
```



### 常用命令

* <kbd>**pip list**</kbd> - 列出已安装模块
* <kbd>**pip freeze**</kbd> - 同上
* <kbd>**pip freeze > [路径]/requirements.txt**</kbd> - 导出requirements.txt
* <kbd>**pip uninstall [模块名]**</kbd> - 卸载模块
* <kbd>**pip uninstall -r requirements.txt**</kbd> - 卸载 requirements.txt 中的模块
* <kbd>**pip install -U [模块名]**</kbd> - 升级模块
* <kbd>**pip install -U pip**</kbd> - 升级 pip
* <kbd>**pip show -f [模块名]**</kbd> - 显示模块所在目录
* <kbd>**pip search [模块名]**</kbd> - 搜索模块
* <kbd>**pip list -o**</kbd> - 查询可升级的模块
* <kbd>**pip install [模块名] -d [路径]**</kbd> - 下载模块而不安装
* <kbd>**pip install -d [路径] -r requirements.txt**</kbd> - 下载 requirements.txt 中模块但不安装，保存在 [路径] 下
* <kbd>**pip wheel [模块]**</kbd> - 打包模块
* <kbd>**$HOME/.pip/pip.conf**</kbd> - 指定 pip 全局镜像源
* <kbd>****</kbd> - 



## 【参考】

* [Python安装第三方模块总结 - 果冻想](https://www.jellythink.com/archives/541)
* [Python 包管理工具解惑 - ZRONG's Blog](https://blog.zengrong.net/post/python_packaging/)