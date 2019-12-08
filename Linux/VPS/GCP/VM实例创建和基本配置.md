# GCP 使用

## 连接配置

### 一、配置 root 密码登录

* 使用 Google Cloud SSH 连接上去
* 切换到 root：`sudo -i`
* 编辑 ssh 配置文件：`vim /etc/ssh/sshd_config`
```bash
# 修改以下内容即可
PermitRootLogin yes
PasswordAuthentication yes
```
* 重启 ssh：`service sshd restart`

### 二、配置密钥登录

* 进入谷歌云平台页面 -> 计算引擎 -> 元数据 -> SSH 密钥，粘贴保存即可

* 谷歌就会把上面这段 public key 写入到 `~/.ssh/authorized_keys`

