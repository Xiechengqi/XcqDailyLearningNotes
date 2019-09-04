# awk 学习

* awk 是一种处理文本文件的语言，是一个强大的文本分析工具
* awk 更适合格式化文本，对文本进行较复杂格式处理
* awk 是以列为划分计数的，$0 表示所有列，$1 表示第一列，$2 表示第二列

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
