# Flask 学习

* 依赖：[Werkzeug](http://werkzeug.pocoo.org/) 和 [Jinja2](http://jinja.pocoo.org/2/) 
  * Werkzeug 是一个 WSGI（在 Web 应用和多种服务器之间的标准 Python 接口) 工具集
  * Jinja2 负责渲染模板

## Virtualenv 

* 安装

```bash
# mac linux
$ sudo easy_install virtualenv
# or
$ sudo pip install virtualenv
# or in Ubuntu
$ sudo apt install python-virtualenv
```

* 创建、启动、关闭 python virtualenv

<kbd>**创建**</kbd>

```bash
# 在当前目录下创建一个名为 venv 的 python virtualenv
$ virtualenv venv
Using base prefix '/usr'
  No LICENSE.txt / LICENSE found in source
New python executable in /root/Python/virtualenv/venv/bin/python3
Also creating executable in /root/Python/virtualenv/venv/bin/python
Installing setuptools, pip, wheel...
done.

```

<kbd>**启动**</kbd>

``` bash
$ . ./venv/bin/activate
# or
$ source ./venv/bin/activate
```

<kbd>**关闭**</kbd>

```bash
# 可以在任何目录执行
$ deactivate
```

* virtualenv 安装最新 Flask 库

```bash
$ git clone http://github.com/mitsuhiko/flask.git
Initialized empty Git repository in ~/dev/flask/.git/
$ cd flask
$ virtualenv venv --distribute
New python executable in venv/bin/python
Installing distribute............done.
$ . venv/bin/activate
$ python setup.py develop
...
Finished processing dependencies for Flask
# 这会拉取依赖并激活 git head 作为 virtualenv 中的当前版本。然后你只需要执行 git pull origin 来升级到最新版本
```

