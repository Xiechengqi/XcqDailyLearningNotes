# Docker 基础学习笔记

## 常用命令

* <kbd>docker search 关键字</kbd> - 默认从 docker hub 搜索指定镜像
* <kbd>docker pull 镜像名:tag</kbd> - 拉取镜像
* <kbd>docker images</kbd> - 列出已安装的镜像
* <kbd>docker rmi image-id</kbd> - 删除指定镜像
* <kbd>docker rm container-id</kbd> - 删除指定容器
* <kbd>docker ps</kbd> -  查看运行中的容器 `-a` 查看所有容器
* <kbd>docker start|stop container-id|container-name</kbd> - 通过容器 id 或容器名运行 / 关闭容器
* <kbd>docker run --name 容器名 -d -p 3306:3306 mysql</kbd>  - docker 启动容器
  * `--name` - 自定义容器名
  * `-p` - 端口映射，`-p 宿主机端口:容器端口`
  * `-d` - 守护进程
*  docker logs container-name/container-id 查看容器日志
* Ctrl+P+Q 退出容器交互式界面，但不关闭容器
* docker help - 检查最新 Docker 可用命令
* docker attach—将本地输入、输出、错误流附加到正在运行的容器
* docker commit—从当前更改的容器状态创建新镜像
* docker exec—在活动或正在运行的容器中运行命令
* docker exec -it container command
* docker history [img]—显示镜像历史记录
* docker info—显示系统范围信息
* docker inspect [img|con]—查找 docker 指定容器和镜像的系统级信息
* docker login --username=xxx --email=xxx - 登录到本地注册表或 Docker Hub
* docker pull—从本地注册表或 Docker Hub 中提取镜像或存储库
* docker ps—列出容器的各种属性
* docker start/stop/restart—启动/关闭/重启容器
* docker rm—移除容器
* docker rmi—删除镜像
* docker run—在隔离容器中运行命令
* docker search—在 Docker Hub 中搜索镜像
* docker version—显示 docker 版本信息
* <kbd>**docker network**</kbd> - 管理网络
* docker network ls
* docker network connect
* docker network create
* docker network disconnect
* docker network inspect
* docker network prune
* docker network rm



## Docker 基础架构

* C/S 架构 - 客户端、服务器两大组件
* 客户端、服务器可以通过 socket 或 RESTful API 进行通信

### 服务端

#### 一、四大组件

1. <kbd>**dockerd**</kbd>

2. <kbd>**docker-proxy**</kbd>

dockerd 子进程，当容器启动并使用端口映射时才会执行，负责配置容器的端口映射规则

```bash
$ ps aux | grep docker-proxy
root     24923  0.0  0.0 700716  4656 ?        Sl   13:19   0:00 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8011 -container-ip 172.17.0.2 -container-port 80
root     24937  0.0  0.0 626728  3824 ?        Sl   13:19   0:00 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 2222 -container-ip 172.17.0.2 -container-port 2222
```

3. <kbd>**containerd**</kbd>

dockerd 子进程



4. <kbd>**containerd-shim**</kbd>

containerd 子进程

### 客户端





## 命名空间 - namespace

* 操作系统中，进程间共享的资源有内核、文件系统、网络、进程号 ( Process ID, PID )、用户号 ( User ID，UID )、进程间通信 ( InterProcess Communication，IPC )等。Linux 命名空间就是为了实现以上的相互隔离，保证了容器之间彼此互补影响



1. <kbd>**进程命名空间**</kbd>









2. <kbd>**IPC 命名空间**</kbd>

* IPC - Interprocess Communication - 进程间交互
* 容器中的进程交互还是采用 Linux 常见 IPC，包括信号量、消息队列、共享内存等方式





3. <kbd>**网络命名空间**</kbd>



4. <kbd>**挂载命名空间**</kbd>





5. <kbd>**UTS 命名空间**</kbd>

* UTS - UNIX Time-sharing System
* 



6. <kbd>**用户命名空间**</kbd>



## 控制组 - Control Groups - CGroups

* Linux 内核特性，主要用来对共享资源进行隔离、限制、审计等



## 联合文件系统 - Union File System - UnionFS

