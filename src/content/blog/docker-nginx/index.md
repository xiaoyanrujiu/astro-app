---
title: Docker 安装 nginx
date: 2024-12-04
updateDate: 2024-12-04
tags: [docker]
category:
  - Linux
  - Docker
image: ./cover.jpg
---

Docker 安装 nginx

## 1. 安装 nginx

- 拉取 nginx 最新镜像

```bash
docker pull nginx:latest
```

- 启动一个 nginx 容器，将配置文件暴露出来

```bash
docker run -d --name nginx  -p 80:80 nginx
```

- 创建 html 目录

```bash
mkdir -p /home/nginx/html
```

- 创建 ssl 目录

```bash
mkdir -p /home/nginx/ssl
```

- 创建配置目录

```bash
mkdir -p /home/nginx/conf
```

- 创建日志目录

```bash
mkdir -p /home/nginx/logs
```

- 复制 conf 文件到目录中

```bash
docker cp 容器id:/etc/nginx/nginx.conf /home/nginx/conf
```

- 删除 nginx 容器

```bash
docker rm -f nginx
```

- 启动一个新的 nginx 容器，修改映射目录

```bash
docker run -d -p 80:80 --name nginx -v /home/nginx/html:/usr/share/nginx/html -v /home/nginx/conf/nginx.conf:/etc/nginx/nginx.conf -v /home/nginx/logs:/var/log/nginx --privileged=true nginx:latest
```

## 2. nginx 配置文件

- 默认配置文件

```conf
# 指定 Nginx 进程所属的用户和组，这里设置为 nginx 用户
user  nginx;
# 设置 worker 进程的数量，这里使用 auto 让 Nginx 自动选择合适的数量
worker_processes  auto;

# 指定错误日志的位置
error_log  /var/log/nginx/error.log notice;
# 指定 Nginx 主进程的 PID 文件的位置
pid        /var/run/nginx.pid;

# 加载动态模块的配置文件
include /etc/nginx/conf.d/*.conf;

# 定义与事件处理相关的参数，如连接数、worker 进程
events {
    worker_connections  1024;
}

# 定义 HTTP 协议相关的配置
http {
    # 定义访问日志的格式
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    # 指定访问日志的位置和格式
    access_log  /var/log/nginx/access.log  main;

    # 性能优化参数
    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    # 包含 MIME 类型定义文件
    include       /etc/nginx/mime.types;
    # 默认 MIME 类型
    default_type  application/octet-stream;

    # 定义一个虚拟主机 http 协议
    server {
        # 监听端口 80
        listen       80;
        listen       [::]:80;
        #  默认的服务器名称
        server_name  _;

        # 包含默认服务器配置文件
        include /etc/nginx/default.d/*.conf;

        location / {
            # 网站根目录
            root   /usr/share/nginx/html/vue;
            #解决刷新 404
            try_files $uri $uri/ /index.html;
        }

        # 配置反向代理
        location /backend {
            # 去除 backend 前缀
            rewrite  ^/backend/(.*)$ /$1 break;
            # 接口地址
            proxy_pass http://localhost:3000;
        }

        # 配置 404 错误页面
        error_page 404 /404.html;
        # 定义 404 页面的位置
        location = /404.html {
        }

        # 配置 500 系列错误页面
        error_page 500 502 503 504 /50x.html;
        # 定义 500 页面的位置
        location = /50x.html {
        }
    }
}
```

- 配置 https 证书访问

```conf
    # 配置 https 协议可以配置这个选项使 http 跳转到 https
    server {
        listen 80;
        server_name smilen.cn www.smilen.cn;
        return 301 https://$server_name$request_uri;
    }

    # 定义一个虚拟主机 https 协议
    server {
        # 监听端口 443，启用 ssl 和 HTTP/2
        listen       443 ssl http2;
        listen       [::]:443 ssl http2;
        # 指定服务器名称，域名
        server_name  smilen.cn www.smilen.cn;
        # 网站根目录
        root         /frontend/vue;

        #解决刷新 404
        try_files $uri $uri/ /index.html;

        # 配置反向代理
        location /backend {
            # 去除 backend 前缀
            rewrite  ^/backend/(.*)$ /$1 break;
            # 接口地址
            proxy_pass http://127.0.0.1:8000;
        }

        # 指定 SSL 证书和私钥的文件路径
        ssl_certificate "/frontend/ssl/smilen.cn_bundle.crt";
        ssl_certificate_key "/frontend/ssl/smilen.cn.key";
        # 配置 SSL 会话缓存和超时时间
        ssl_session_cache shared:SSL:1m;
        ssl_session_timeout  10m;
        # 配置 SSL 密码套件
        ssl_ciphers HIGH:!aNULL:!MD5;
        # 优先使用服务器端的 SSL 密码套件
        ssl_prefer_server_ciphers on;

        # 加载默认服务器块的附加配置文件
        include /etc/nginx/default.d/*.conf;

        # 配置 404 错误页面
        error_page 404 /404.html;
            location = /40x.html {
        }

        # 配置 500 系列错误页面
        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }
```
