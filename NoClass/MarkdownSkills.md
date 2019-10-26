# 记录 Markdown 的各种小技巧

> 代码块为markdown源码，紧接着展示效果

``` markdown
Simply press <kbd>command</kbd> + <kbd>F</kbd> to search for a keyword
```

Simply press <kbd>command</kbd> + <kbd>F</kbd> to search for a keyword

```
<img src="https://github.com/vsouza/awesome-ios/blob/master/header.png">
````
<img src="https://github.com/vsouza/awesome-ios/blob/master/header.png">

```
## [Badidu](www.baidu.com)公司
```
## [Badidu](www.baidu.com)公司

:musical_keyboard: 
:sparkles:

```
图片居中显示
<div align=center>
<img src="路径">
</div>
```

<div align=center>
<img src="https://www.baidu.com/img/bd_logo1.png?where=super">
</div>

```
图片设置链接
[![百度](https://www.baidu.com/img/bd_logo1.png?where=super)](https://www.baidu.com)
```
未设置图片链接
![百度](https://www.baidu.com/img/bd_logo1.png?where=super)

设置图片点击跳转到　https://www.baidu.com
[![百度](https://www.baidu.com/img/bd_logo1.png?where=super)](https://www.baidu.com)

```
设置图片缩放、大小
<img src="https://www.baidu.com/img/bd_logo1.png?where=super"　width="25%" height="25%">
```

<img src="https://www.baidu.com/img/bd_logo1.png?where=super" width="25%" height="25%"/>

```<img src="https://www.baidu.com/img/bd_logo1.png?where=super" width=500 height=300/>```
<img src="https://www.baidu.com/img/bd_logo1.png?where=super" width=500 height=300/>

``` markdown
在图片下加标注
<div align=center>
<img src="https://www.baidu.com/img/bd_logo1.png?where=super" />
<br>标注内容
</div>
```

<div align=center>
<img src="https://www.baidu.com/img/bd_logo1.png?where=super"><br>百度
</div>

``` markdown
| 一个普通标题 | 一个普通标题 | 一个普通标题 |
| ------ | ------ | ------ |
| 短文本 | 中等文本 | 稍微长一点的文本 |
| 稍微长一点的文本 | 短文本 | 中等文本 |
```
| 一个普通标题 | 一个普通标题 | 一个普通标题 |
| ------ | ------ | ------ |
| 短文本 | 中等文本 | 稍微长一点的文本 |
| 稍微长一点的文本 | 短文本 | 中等文本 |

```
| 左对齐标题 | 右对齐标题 | 居中对齐标题 |
| :------| ------: | :------: |
| 短文本 | 中等文本 | 稍微长一点的文本 |
| 稍微长一点的文本 | 短文本 | 中等文本 |
```
| 左对齐标题 | 右对齐标题 | 居中对齐标题 |
| :------| ------: | :------: |
| 短文本 | 中等文本 | 稍微长一点的文本 |
| 稍微长一点的文本 | 短文本 | 中等文本 |

```
| 命令 | 解释 |
| --- | --- | 
| ps -aux &#124; grep mysql |  表格中竖线显示 |
| <code>ps -aux &#124; grep mysql</code> | 表格代码中竖线显示 |
| &lt;code&gt; | 表格中左、右尖括号显示 |
| &amp; | 表格中 And 符号显示 |
| 第一行<br/> 第二行<br/> | 表格中换行 |
| -&ensp;- | 半角空格 |
| -&emsp;- | 全角空格 |
```

| 示例 | 解释 |
| --- | --- | 
| ps -aux &#124; grep mysql |  表格中竖线显示 |
| <code>ps -aux &#124; grep mysql</code> | 表格代码中竖线显示 |
| &lt;code&gt; | 表格中左、右尖括号显示 |
| &amp; | 表格中 And 符号显示 |
| 第一行<br/> 第二行<br/> | 表格中换行 |
| -&ensp;- | 半角空格 |
| -&emsp;- | 全角空格 |


> * `|、-、:`之间的多余空格会被忽略，不影响布局
> * 默认标题栏居中对齐，内容居左对齐
> * `-:`表示内容和标题栏居右对齐，`:-`表示内容和标题栏居左对齐，`:-:`表示内容和标题栏居中对齐
> * 内容和`|`之间的多余空格会被忽略，每行第一个`|`和最后一个`|`可以省略，`-`的数量至少有一个


```
├── coding
│   ├── baidutranslate.ipynb
│   ├── Python datetime.ipynb
│   ├── Python hashlib.ipynb
│   ├── Python urllib.ipynb
│   ├── Python 多进程和多线程.ipynb
│   ├── Python 模版.ipynb
│   ├── test1.py
│   ├── test.py
│   └── 未命名.ipynb
├── learning.py
└── src
```

``` 
制表符
┌ └ ┐ ┘ ─ │ ├ ┤ ┬ ┴ ┼

就是制作表格用的符号。
可以用输入法自带的特殊符号输入，也可以从现成的表格中撷取粘贴
```
