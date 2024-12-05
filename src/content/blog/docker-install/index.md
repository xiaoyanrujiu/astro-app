---
title: Docker 安装
date: 2024-12-02
updateDate: 2024-12-02
tags: [docker]
category:
  - Linux
  - Docker
image: ./cover.jpg
---

Docker 安装

## 1. 安装操作

- 卸载旧版本 dcoker（第一次安装不需要）

```bash
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
```

- 安装 docker 仓库所需的工具

```bash
sudo yum install -y yum-utils
```

- 安装国内镜像源

```bash
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

- 安装 docker

```bash
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

1.5 设置 docker 镜像源

```bash
echo '{ "registry-mirrors": [
"https://0c105db5188026850f80c001def654a0.mirror.swr.myhuaweicloud.com",
"https://5tqw56kt.mirror.aliyuncs.com",
"https://docker.1panel.live",
"http://mirrors.ustc.edu.cn/",
"http://mirror.azure.cn/",
"https://hub.rat.dev/",
"https://docker.ckyl.me/",
"https://docker.chenby.cn",
"https://docker.hpcloud.cloud",
"https://docker.m.daocloud.io" }' | sudo tee /etc/docker/daemon.json
```

## 2 常用命令

- 启动 docker

```bash
sudo systemctl start docker
```

- 关闭 docker

```bash
sudo systemctl start docker
```

- 重启 docker

```bash
sudo systemctl restart docker
```

- 开机自启 docker

```bash
sudo systemctl enable docker
```

- 删除镜像

```bash
docker rmi image_name
```

- 删除容器

```bash
docker rm -f container_name
```

- 查看镜像列表

```bash
docker image ls
```

- 查看容器列表

```bash
docker ps -a
```

- 重启镜像

```bash
docker restart image_name
```

## 3. 镜像操作

- 镜像拉取

```bash
docker pull image-name
```

- 构建镜像

```bash
docker build -t image-name:1.0 .
```

- 镜像导出

```bash
docker save -o my-image.tar my-image:1.0
```

- 镜像导入

```bash
docker load -i image-name.tar
```

- 运行镜像

```bash
docker run -d --restart=always -p 80:80 --name=image-app image-app:1.0
```
