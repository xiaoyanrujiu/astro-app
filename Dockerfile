# 基于Node.js镜像构建
FROM node:20.11-alpine3.19 as build

# 设置工作目录
WORKDIR /app

# 将package.json和package-lock.json复制到工作目录
COPY package*.json ./

# 安装依赖
RUN yarn global add pnpm && pnpm config set registry https://registry.npmmirror.com && pnpm install

# 将项目文件复制到工作目录
COPY . .

# 构建项目
RUN pnpm run build

# 基于Nginx镜像构建
FROM registry.cn-hangzhou.aliyuncs.com/tao-library/nginx:1.25.3

# 将nginx配置文件复制到容器中
COPY --from=build /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf

# 将构建好的静态文件复制到nginx服务器的工作目录
COPY --from=build /app/dist/ /usr/share/nginx/html/dist

# 将 SSL 证书复制到容器中
COPY --from=build /app/nginx/ssl/smilen.cn.key /usr/share/nginx/ssl/smilen.cn.key
COPY --from=build /app/nginx/ssl/smilen.cn_bundle.crt /usr/share/nginx/ssl/smilen.cn_bundle.crt

# 暴露443端口
EXPOSE 443

# 启动nginx，并持续运行
CMD ["nginx", "-g", "daemon off;"]
