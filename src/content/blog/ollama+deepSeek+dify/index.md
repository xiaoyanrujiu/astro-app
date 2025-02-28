---
title: Ollama + DeepSeek + Dify 安装
date: 2025-02-28
updateDate: 2025-02-28
tags: [docker]
category:
  - Linux
  - Docker
image: ./cover.jpg
---

# Ollama + DeepSeek + Dify 安装

## 1.安装 Ollama

### 1.下载 Ollama

打开浏览器，访问 Ollama 官网：https://ollama.ai

![Ollama 首页](./images/ollama-home.png)

点击【Download】按钮跳转到 Ollama 下载页面，然后选择合适我们自己电脑的软件版本，如下图：

![Ollama 下载](./images/ollama-download.png)

### 2.安装 Ollama

Ollama 默认安装在 C 盘，但可以通过以下方法将其安装到其他磁盘分区

先使用命令提示符导航到保存“OllamaSetup.exe”文件的目录，再输入以下命令来指定安装路径：

```bash
"C:\Users\hanjiahui\Downloads\OllamaSetup.exe" /DIR="D:\Program Files\Ollama"
```

安装完成后，可以输入 Ollama -v，查看 Ollama 安装的版本信息，如下图：

![Ollama 版本](./images/ollama-version.png)

## 2.下载 DeepSeek 模型

注意：Ollama 模型下载的目录默认是在 C 盘，但可以通过以下方法将其下载到其他磁盘分区

### 1.下载模型前的准备

在 Ollama 安装目录下新建 models 文件夹，如下图：

![创建 models](./images/create-models.png)

右键点击【此电脑】或【计算机】图标，选择【属性】，然后点击【高级系统设置】，并在【系统属性】窗口中，切换到【高级】选项卡，点击【环境变量】。

![设置环境变量](./images/setting-var.png)

在【环境变量】窗口中，【系统变量】下点击【新建】按钮，输入变量名 OLLAMA_MODELS，变量值为新创建的目录路径，例如 D:\Program Files\Ollama\models，具体如下图：

![新建环境变量](./images/add-var.png)

### 2.下载模型

搞定 Ollama 后，就该下载 DeepSeek 模型了。在 Ollama 网站的 Models 页面，找到 DeepSeek 模型，它有从 1.5B 到 671B 不等的多个参数规模可供选择，大家一定要根据自己的电脑配置，尤其是内存和显存，来挑选合适的模型规模。

![搜索 deepseek 模型](./images/search-deepseek.png)

根据电脑配置选择对应的模型，然后进行下载

![选择模型版本下载](./images/select-version.png)

选好后，复制右边的命令，粘贴到 cmd 命令提示符中运行，系统就会开始下载模型，大概二十分钟左右（具体还得看网速）

![下载模型](./images/download-model.png)

模型下载成功

![模型下载成功](./images/download-success.png)

## 3.安装 dify 环境

使用 git 将代码拉去到本地

```bash
git clone git@github.com:langgenius/dify.git
```

进入项目根目录找到 docker 文件夹，如下图：

![docker 文件夹](./images/dify-docker.png)

然后将 .env.example”命名为 .env

![去除 example 后缀](./images/remove-suffix.png)

在当前文件夹中，启动终端工具

```bash
docker compose up -d
```

![创建容器启动](./images/cmd-docker.png)

耐心等待，成功后的界面如下：

![容器启动成功](./images/docker-success.png)

## 4.安装 dify

在浏览器地址栏中输入 http://localhost/install 即可开始安装，如下图：

![初始化 dify](./images/init-dify.png)

设置完账户后进行登录

![登录 dify](./images/login-dify.png)

登录成功后进入 Dify 主页，如下图：

![初始化 dify](./images/dify-home.png)

## 5. 将本地大模型与 Dify 进行关联

### 1. 配置 dify

在 Dify 项目的 docker 文件夹里找到.env 文件，在末尾填上配置：

```bash
# 启用自定义模型
CUSTOM_MODEL_ENABLED=true
# 指定 Olama 的 API地址（根据部署环境调整IP）
OLLAMA_API_BASE_URL=host.docker.internal:11434
```

### 2. 配置大模型

返回到 Dify 主界面，点击右上角用户名下的设置

![dify 设置](./images/dify-setting.png)

选择【模型供应商】，找到对应的 Ollama，点击【添加模型】，填写 DeepSeek 模型信息后点击【保存】

![添加模型](./images/add-ollama-model.png)

## 6.创建应用

### 1. 创建空白应用

进入 Dify 主界面，点击【创建空白应用】，如下图：

![创建应用](./images/create-app.png)

### 2.应用配置

选择【聊天助手】，输入自定义应用名称和描述，点击【创建】

![应用配置](./images/app-config.png)

### 3.配置模型

右上角选择合适的模型（如 DeepSeek 或 Ollama），并配置相关参数

![配置模型](./images/config-model.png)

### 4. 测试

在下方对话框中输入你是谁，将会显示相应的输出内容，如下图：

![测试模型](./images/test-model.png)

以上表明，Dify 与本地部署的 DeepSeek 大模型已经连通了。

- > 相关链接