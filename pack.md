## 1. docker 命令

```sh
# 打包镜像
docker build -t astro-app:1.0 .

# 运行镜像
docker run -d --restart=always -p 80:80 -p 443:443 --name=astro-app astro-app:1.0
```