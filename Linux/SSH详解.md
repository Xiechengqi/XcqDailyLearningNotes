# SSH 详解

## 应用篇

* SSH 登录通常有**密码登录**和**密钥登录 ( 或无密码直接登录 )**

### 密码登录

[参见 aws 首次登录配置](https://github.com/Xiechengqi/XcqDailyLearningNotes/blob/master/Linux/VPS/AWS/lightsail.md)


### 无密码登录

1. 生成本地 RSA / DSA 密钥对

```bash
$ ssh-keygen
# 一路回车就可
# root 用户生成公私钥在：/root/.ssh/
# 非 root 用户：在自己主目录下的 .ssh/
```

2. 将本地公钥内容追加到远程服务器的 `/root/.ssh/authorized_keys` 或 用户目录下的 `.ssh/authorized_keys`

``` bash
# 也可以使用 ssh-copy-id
$ ssh-copy-id root@目标节点IP

# ssh-copy-id root@192.168.56.101
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@192.168.56.101's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'root@192.168.56.101'"
and check to make sure that only the key(s) you wanted were added.
```

3. 重启 ssh, 退出再次登陆即可实现无密码登录

## 原理篇

### 背景: 密码学加密算法

* 加密方法可以分为两大类，一类是单钥加密（ private key cryptography ），还有一类叫做双钥加密（ public key cryptography ）。前者的加密和解密过程都用同一套密码，后者的加密和解密过程用的是两套密码

### 对称密钥加密 - Symmetric-key algorithm（又称为对称加密、私钥加密、共享密钥加密、单钥加密）

* 这类算法在加密和解密时使用相同的密钥，或是使用两个可以简单地相互推算的密钥，所以这被称为 "对称加密算法"
* 1976 年以前，所有的加密算法都使用 "对称加密算法"，通用的单钥加密算法为 DES（ Data Encryption Standard ）
* 在对称密钥加密的情况下，密钥只有一把，所以密钥的保存变得很重要。一旦密钥泄漏，密码也就被破解

### 公开密钥（ yue )加密 - Public-key cryptography（ 称为非对称加密 - asymmetric cryptography ）

> * 【mì yuè】读音下的“密钥”的意思：紧密的锁闭。这里的用法用了“密钥”的动词性质。
> * 【 mì yào】读音下的“密钥”的意思：密码学中的专有名词，指解密所需要的特殊代码。这里用了“密钥”的名词性

* 公开密钥加密需要两个密钥，一个是公开密钥（ 加密使用 ），另一个是私有密钥（ 解密使用 ）

## SSH - Secure Shell

通过使用 SSH，你可以把所有传输的数据进行加密，这样“中间人”这种攻击方式就不可能实现了，而且也能够防止 DNS 和 IP 欺骗。还有一个额外的好处就是传输的数据是经过压缩的，所以可以加快传输的速度。 SSH 有很多功能，它既可以代替 telnet，又可以为 ftp、pop、甚至 ppp 提供一个安全的“通道”

 最初 SSH 是由芬兰的一家公司开发的。但是因为受版权和加密算法的限制，现在很多人都转而使用 OpenSSH。 OpenSSH 是 SSH 的替代软件，而且是免费的,可以预计将来会有越来越多的人使用它而不是 SSH。SSH 是由客户端和服务端的软件组成的，有两个不兼容的版本分别是：1.x 和 2.x。用 SSH 2.x 的客户程序是不能连接到 SSH 1.x 的服务程序上去的。OpenSSH 2.x 同时支持 SSH 1.x 和 2.x

## 补充参考
* [数字签名是什么？- 阮一峰](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)
* [SSH原理与运用 - 阮一峰](http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html)

