---
title: Docker 安装 portainer
date: 2025-02-26
updateDate: 2025-02-26
tags: [docker]
category:
  - Linux
  - Docker
image: ./cover.jpg
---

# Docker 安装 portainer

## 1.拉取镜像

- ce，开源版本，适用于大多数个人用户和小型团队，默认版本
- be，付费版本，包含更多企业级功能，比如用户管理、访问控制、更强的安全性、集成 Kubernetes 支持、LDAP 支持等

```bash
docker pull portainer/portainer #同于 docker pull portainer/portainer-ce
```

## 2.创建容器启动

- 创建一个名为 portainer_data 的卷，用于存储数据库文件

```bash
docker volume create portainer_data
```

- 创建容器启动

```bash
docker run -d -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```

## 3.访问可视化界面

- 访问地址：https://127.0.0.1:9443
