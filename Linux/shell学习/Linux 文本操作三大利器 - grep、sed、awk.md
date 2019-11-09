# grep、sed、awk 详解

* grep -  更适合单纯的查找或匹配文本
* sed -  更适合编辑匹配到的文本
* awk - 更适合格式化文本，对文本进行较复杂格式处理

# grep

* grep - global search regular expression(RE) and print out the line - 全面搜索正则表达式并把行打印出来

# sed

* sed - stream editor - 流编辑器
* 一次处理一行内容，处理时，把当前处理的行存储在临时缓冲区中，称为“模式空间”( pattern space )，接着用 sed 命令处理缓冲区中的内容，处理完成后，把缓冲区的内容送往屏幕
* sed 不会修改源文件内容
* sed 适合使用 vi 类编辑器操作不太方便的情况，比如操作有数千行的文本和在 shell 脚本中需要修改文本文件
* <kbd>**sed [选项] '命令' \<输入文件\>**</kbd>
 
* [选项]
  * <kbd>-n</kbd> - 取消默认输出 ( sed 默认会打印模式空间里的内容 )
  * <kbd>-e</kbd> - 多点编辑，可以执行多个子命令，每个 `-e` 后都可以接一个 '命令'
  * <kbd>-f</kbd> - 从脚本文件中读取命令（ sed 操作可以事先写入脚本，然后通过 `-f` 读取并执行）
  * <kbd>-r</kbd> - 在 '命令' 中允许使用扩展正则表达式，默认是允许基础正则表达式
  * <kbd>-i</kbd> - 直接编辑原文件，且不输出到终端
* '命令'
  * <kbd>a</kbd> -  append - 在当前行后面加入一行或多行 ( \n ) 或文本
  * <kbd>c</kbd> - chang - 用 c 后面跟上字符串替换选中的行
  * <kbd>d</kbd> - delete - 命令会将当前选中的行删除
  * <kbd>i</kbd> - insert - `i \` 后面跟上字符串s ( 多行字符串可以用 `\n` 分隔)，则会在当前选中的行的前面都插入字符串 s
  * <kbd>p</kbd> - print - 该命令会打印当前选择的行到屏幕上
  * <kbd>s/re/string/[flag]</kbd> -  subs - 用 string 替换正则表达式 re
g 
=： 显示文件行号 

### 常用命令

> * `sed -n` 修改行后不会有输出，所以想查看结果，一般会用 `sed -n -e '操作' -e '1,$p' filename`
> * `$` - 文本最后一行

#### 对指定的 n~m 行操作

* 显示 n~m 行
  * `sed -n 'n,mp' filename
* 新增行
  * 第 n 行后新增字符串 string：`sed 'na string' filename`
  * 第 n 行前新增字符串 string：`sed 'ni string' filename`
  * 需要新增多行，新增行末尾加 `\`，再换行输入下一新增行即可
* 删除 n~m 行
  * `sed 'n,md' filename`
  * `sed 'n,$d' filename` - 删除从第 n 行开始到结束所有行，`$` 代表最后一行
  * `sed 'n' filename` - 删除第 n 行单行
* 替换 n~m 行
  * `sed 'n,mc newstring' filename` - 用 newstring 替换第 n~m 行

#### 对匹配 string 的行操作

> * 在指定 n~m 行内操作匹配 string 的行：`sed -n -e '[位置参数] 操作命令' -e '1,$ p'  filename`
>   * eg: `sed -n -e '2,3 s/old/new/g' -e '1,$ p' inputfile`

* 显示匹配 string 的行
  * `sed -n '/string/p' filename
* 删除匹配 string 的行
  * `sed -n '/string/d' filename
* 用 new 字符串替换 string 字符串
  * `sed '[位置参数] s/string/new/[替换标志]'`
  * [替换标志] - 标志可以一起使用，比如 `2p` 就是替换每行第 2 个匹配的字符串，并打印修改过的行
    * <kbd>g</kbd> - 全局替换，会替换文本行中所有匹配的字符串
    * <kbd>n</kbd> ( 数字 ) - 替换每行中第 n 个匹配的字符串
    * <kbd>p</kbd> - 替换第一个匹配的字符串，并打印修改过的行
    * <kbd>w</kbd> - 替换每行第一个匹配的字符串，
    * <kbd>缺省</kbd> - 默认替换每行第一个匹配的字符串
* 对匹配 string 行执行自定义命令
  * `sed -n '[位置参数] s/string/{命令}' filename`
 
# awk

* awk 是一种处理文本文件的语言，是一个强大的文本分析工具
* awk 更适合格式化文本，对文本进行较复杂格式处理
* awk 是以列为划分计数的，$0 表示所有列，$1 表示第一列，$2 表示第二列

基本格式：awk options program-file

options  选项

| 选项 | 解释 |
| --- | --- |
| -F fs | 划分数据字段的分隔符 |
| -f file | 从指定文件中读取 awk 命令 |
| -v var=value |  |

## 经常用法

### 一、`awk '{[pattern] action}' {filenames}`   

> 行匹配语句 awk '' 只能用单引号

``` shell
 $ cat income.txt
1 3 4490
2 5 3896
3 4 3112
I'm eating apples,oranges and graphs!
$ awk '{printf("%d %d %d\n", $1, $2, $3);}' income.txt
1 3 4490
2 5 3896
3 4 3112
I'm eating apples,oranges

# $1 $2 $3 分别为每行以空格分割的第 1、2、3 项 
```
