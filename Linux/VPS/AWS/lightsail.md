# AWS LightSail 创建和基本配置

## 本地使用 ssh 命令行登录

### 讲解

1.  首次登录命令: `ssh -i xxx.pem username@host_ip`

<div align=center>
  <img src="./images/08.jpg"><br/>使用密钥直接登录无需密码
</div>
<br/>

2. `xxx.pem` 可以在 aws lightsail 服务器控制台下载 **( Lightsail 在您创建实例的每个 AWS 区域中创建一个默认密钥对 )** 

<div align=center>
  <img src="./images/07.jpg"><br/>每个地区都有自己的默认密钥
</div>
<br/>

3. 首次登录用户需要在实例的 "管理" 中的 "连接" 页面查看

<div align=center>
  <img src="./images/09.jpg"><br/>
</div>
<br/>

4. 登录后切换成 root 用户,修改 root 密码

5. 之后修改 `~/.ssh/authorized_keys` 文件，则以后可以使用用户 root 直接登录


### 实操截屏

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


<br/>
<div align=center>
  <img src="./images/05.jpg"><br/>切换到私钥目录
</div>
<br/>

<div align=center>
  <img src="./images/06.jpg"><br/>修改私钥权限为 600
</div>
<br/>



> * 删除`/root/.ssh/authorized_keys`中 `ssh-rsa` 前面内容 ( 没有则不修改 )，保存退出服务器

> * 再次登录时即可使用`ssh root@host_ip`,之后输入密码即可登入
 
