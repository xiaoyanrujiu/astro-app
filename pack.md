## 1. docker 命令

```sh
# 打包镜像
docker build -t astro-app:1.5 .

# 打包镜像
docker save -o astro-app.tar astro-app:1.5

# 加载镜像
docker load -i astro-app.tar

# 运行镜像
docker run -d --restart=always -p 80:80 -p 443:443 --name=astro-app astro-app:1.0
```