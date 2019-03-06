# Python 学习遇到的问题解决或扩展小知识

## 目录

* [`# -*- coding: UTF-8 -*-`和`#coding=utf-8`中文编码问题](#----coding-utf-8---和coding=utf-8中文编码问题-top)





## `# -*- coding: UTF-8 -*-`和`#coding=utf-8`中文编码问题 [【Top】](#目录)

Python 中默认的编码格式是 ASCII 格式，在没修改编码格式时无法正确打印汉字，所以在读取中文时会报错

解决方法为只要在文件开头加入 `# -*- coding: UTF-8 -*-` 或者 `#coding=utf-8` 就行了

> 注意：`#coding=utf-8` 的 = 号两边不要空格。
