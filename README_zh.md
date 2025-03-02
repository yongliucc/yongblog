# YongBlog

一个使用 Go 后端和 React TypeScript 前端构建的现代博客平台。

[![Go Version](https://img.shields.io/badge/Go-1.23.6-blue.svg)](https://golang.org/)
[![Node Version](https://img.shields.io/badge/Node-22.14.0-green.svg)](https://nodejs.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 概述

YongBlog 是一个为开发者和内容创作者设计的轻量级、高性能博客平台。它具有由 Go 驱动的后端 API 和使用 Vite 构建的现代 React TypeScript 前端。

## 特性

- 快速轻量的博客引擎
- 现代化的 React TypeScript UI
- 基于 Go 的 RESTful API
- 适配所有设备的响应式设计
- 支持 Markdown 内容格式
- 用户认证和授权
- 评论系统
- 搜索功能
- 标签和分类管理

## 入门指南

### 前提条件

- Go 1.23.6 或更高版本
- Node.js 22.14.0 或更高版本
- PNPM 包管理器

### 安装

请参考我们详细的安装指南：

- [英文安装指南](docs/dev_env_setup_en.md)
- [中文安装指南](docs/dev_env_setup_zh.md)

### 快速开始

```bash
# 克隆仓库
git clone https://github.com/yongliucc/yongblog.git
cd yongblog

# 启动后端服务器
go run cmd/server/main.go

# 在另一个终端中，启动前端
cd ui
pnpm install
pnpm dev
```

## 项目结构

```
yongblog/
├── cmd/                # 命令行应用
│   └── server/         # 主服务器入口点
├── internal/           # 私有应用代码
│   ├── api/            # API 处理器
│   ├── auth/           # 认证逻辑
│   ├── config/         # 配置
│   ├── db/             # 数据库访问
│   ├── models/         # 数据模型
│   └── services/       # 业务逻辑
├── pkg/                # 公共库
├── ui/                 # 前端 React 应用
│   ├── public/         # 静态资源
│   └── src/            # React 源代码
├── docs/               # 文档
└── scripts/            # 实用脚本
```

## 许可证

该项目采用 MIT 许可证 - 详情请参阅 [LICENSE](LICENSE) 文件。

## 致谢

- [Go](https://golang.org/)
- [React](https://reactjs.org/)
- [TypeScript](https://www.typescriptlang.org/)
- [Vite](https://vitejs.dev/)

## 联系方式

Yong Liu - [@yongliucc](https://github.com/yongliucc)

项目链接: [https://github.com/yongliucc/yongblog](https://github.com/yongliucc/yongblog) 