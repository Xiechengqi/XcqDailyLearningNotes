# AWS LightSail 创建和基本配置

## 本地使用 ssh 登录

* ssh -i xxx.pem ubuntu(root)@host_ip
  * xxx.pem 可以在 aws lightsail 服务器控制台下载
  * 首次登录使用用户 ubuntu，登录后可以设置`authorized_keys`，则以后可以使用用户 root 直接登录

<div align=center>
  <img src="./images/02.jpg"><br/>
</div>
<br/>
<div align=center>
  <img src="./images/03.jpg"><br/>
</div>
<br/>

<div align=center>
  <img src="./images/04.jpg"><br/>下载私钥
</div>

> **客户端私钥只有一个，不同实例的私钥都相同**

<br/>
<div align=center>
  <img src="./images/05.jpg"><br/>切换到私钥目录
</div>
<br/>

<div align=center>
  <img src="./images/06.jpg"><br/>修改私钥权限为 600
</div>
<br/>
### 删除`/root/.ssh/authorized_keys`中 ssh-rsa 前面内容，保存退出服务器，再次登录时即可使用`ssh -i xxx.pem root@host_ip`
 
