# 开发环境搭建指南

本指南提供在多个平台上搭建 YongBlog 项目开发环境的详细步骤，包括：Windows 系统的 WSL 上的 Ubuntu 22.04、独立安装的 Ubuntu 22.04 以及 macOS。

## 前提条件

- 以下操作系统之一：
  - 安装了 WSL2 的 Windows 10/11 系统和 Ubuntu 22.04 LTS
  - Ubuntu 22.04 LTS（独立安装）
  - macOS

## 搭建步骤

### 1. 创建应用程序目录

#### 对于 Ubuntu（WSL 或独立安装）：

```bash
# 创建应用程序目录
sudo mkdir -p /opt/apps
cd /opt/apps
```

#### 对于 macOS：

```bash
# 创建应用程序目录
sudo mkdir -p /opt/apps
cd /opt/apps
```

### 2. 安装 Go

#### 对于 Ubuntu（WSL 或独立安装）：

```bash
# 下载 Go 1.23.6
wget https://golang.google.cn/dl/go1.23.6.linux-amd64.tar.gz

# 解压 Go 到 /opt/apps
sudo tar -C /opt/apps -xzf go1.23.6.linux-amd64.tar.gz

# 清理下载的压缩包
rm go1.23.6.linux-amd64.tar.gz
```

#### 对于 macOS：

```bash
# 下载 Go 1.23.6
curl -O https://golang.google.cn/dl/go1.23.6.darwin-amd64.tar.gz

# 解压 Go 到 /opt/apps
sudo tar -C /opt/apps -xzf go1.23.6.darwin-amd64.tar.gz

# 清理下载的压缩包
rm go1.23.6.darwin-amd64.tar.gz

# 替代方法：使用 Homebrew 安装
# brew install go
```

### 3. 配置环境变量

在 `~/.bashrc` 文件（Ubuntu）或 `~/.zshrc` 文件（macOS）中添加以下内容：

```bash
# Go 环境变量
export GOROOT=/opt/apps/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
```

应用更改：

```bash
# 对于 Ubuntu
source ~/.bashrc

# 对于 macOS
source ~/.zshrc
```

### 4. 创建项目目录

```bash
# 创建项目目录
mkdir -p /data/projects
cd /data/projects

# 创建并进入 yongblog 项目目录
mkdir yongblog
cd yongblog
```

### 5. 初始化 Go 模块

```bash
# 初始化 Go 模块
go mod init github.com/yongliucc/yongblog
```

### 6. 通过 NVM 安装 Node.js

```bash
# 安装 NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# 重新加载 shell 配置
source ~/.bashrc  # Ubuntu
# 或
source ~/.zshrc   # macOS

# 安装 Node.js 22.14.0
nvm install 22.14.0

# 设置为默认 Node.js 版本
nvm use 22.14.0
```

### 7. 安装 PNPM 并创建 UI 项目

```bash
# 全局安装 PNPM
npm install -g pnpm

# 使用 Vite 创建 React TypeScript 项目
pnpm create vite ui --template react-ts

# 进入 UI 目录
cd ui

# 安装依赖
pnpm install
```

## 验证安装

验证你的安装：

```bash
# 检查 Go 版本
go version

# 检查 Node.js 版本
node -v

# 检查 PNPM 版本
pnpm -v
```

## 项目结构

完成设置后，你的项目结构应该如下所示：

```
/data/projects/yongblog/
├── go.mod
├── ui/
│   ├── node_modules/
│   ├── public/
│   ├── src/
│   ├── package.json
│   └── ...
└── docs/
    ├── dev_env_setup_en.md
    └── dev_env_setup_zh.md
```

## 后续步骤

- 使用 Go 开发后端
- 使用 React 和 TypeScript 开发前端 UI
- 配置项目部署