---
title: 1.Git 安装及初始化
date: 2024-11-05
updateDate: 2024-11-05
tags: [Git]
category:
  - 前端
  - Git
image: ./cover.jpg
---

# Git 安装使用

## 1. 程序安装

[下载地址](https://gitforwindows.org/index.html)

> 本笔记针对 windows 系统，下同

安装过程

1. 将软件安装至一合适文件夹，路径不能有中文即可
2. 安装过程中选项均使用 默认项即可。

使用 Github 通常会使用远程仓库存放代码，所以需要登陆 [github](https://github.com/)，注册 github 帐号，填写合适用户名、邮箱正常注册即可。

## 2. 设置签名

- 签名形式

**用户名 + 对应邮箱**

- 签名作用

区分不同开发人员的身份

> 这里设置的签名和登录远程库（代码托管中心）的账号、密码没有任何关系。但是，通常写的就是 github 网站的账号邮箱及对应用户名

### 2.1 设置当前项目签名

```bash
$ git config user.name [签名]
$ git config user.email [邮箱]
```

设置信息会存储在当前项目中的 .git 文件夹中 config 文件内。

这样设置的签名信息只会对当前项目有效，所以一般在项目初始化之后设置。

### 2.2 设置当前操作系统签名

```bash
$ git config --global user.name [签名]
$ git config --global user.email [邮箱]
```

在 Windows 环境下设置信息存储在 "C:\Users\Administrator\\.gitconfig" 文件中。

这样设置的签名信息会对当前系统的范围内生效。

### 2.3 级别优先级

- 就近原则：项目级别优先于系统用户级别，二者都有时采用项目级别的签名
- 如果只有系统用户级别的签名，就以系统用户级别的签名为准
- 二者都没有不允许
