
``` javascript
> a = 1;
1
> a
1
> delete a;
true
> a
ReferenceError: a is not defined
> var b = 1;
undefined
> b
1
> delete b;
false
> b
1
> window.c = 1;
1
> c
1
> delete c;
true
> c
ReferenceError: a is not defined
```

## 功能
 delete 操作符用于删除对象的某个属性；如果没有指向这个属性的引用，那它最终会被释放
 
## 语法
 
* delete expression
> expression 的计算结果应该是某个属性的引用

例如：
> delete object.property <br>
delete object['property']

## 返回值：True \ False
