# Tomcat 学习

目录
* [Tomcat 安装及配置](#tomcat-安装及配置-top)


## Tomcat 安装及配置 [[Top]](#目录)

> **环境**
> * Ubuntu 18.04 
> * Tomcat 7、8、9
> * JDK-12.0.1

### 1. 安装 Java

```  shell
$ echo $JAVA_HOME
/usr/lib/jvm/jdk-12.0.1
```

### 2. 到[官网](https://tomcat.apache.org/download-80.cgi)或其他软件镜像站，比如[清华镜像站](https://tomcat.apache.org/download-80.cgi)，下载二进制编码包 (  Binary Distributions 或 bin )

> * 下载后一定要使用非 root 用户解压，然后再将解压后文件转移到`/opt/tomcat`（可选其他）


