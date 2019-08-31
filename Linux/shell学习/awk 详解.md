# awk 学习

AWK 是一种处理文本文件的语言，是一个强大的文本分析工具

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
