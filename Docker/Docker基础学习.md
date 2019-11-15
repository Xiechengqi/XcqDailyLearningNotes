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

