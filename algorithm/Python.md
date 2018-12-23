### 斐波那契数列 - 1 1 2 3 5 8 13 21 ...

``` python3
# 返回第 n 个斐波那契数列的数
def feibo( n ):
    a , b = 0 , 1
    for i in range(n):
        a , b = b , a + b
    return b
```
