# YongBlog

A modern blog platform built with Go backend and React TypeScript frontend.

[![Go Version](https://img.shields.io/badge/Go-1.23.6-blue.svg)](https://golang.org/)
[![Node Version](https://img.shields.io/badge/Node-22.14.0-green.svg)](https://nodejs.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Overview

YongBlog is a lightweight, high-performance blog platform designed for developers and content creators. It features a Go-powered backend API and a modern React TypeScript frontend built with Vite.

## Features

- Fast and lightweight blog engine
- Modern React TypeScript UI
- RESTful API with Go
- Responsive design for all devices
- Markdown support for content
- User authentication and authorization
- Comment system
- Search functionality
- Tag and category management

## Getting Started

### Prerequisites

- Go 1.23.6 or higher
- Node.js 22.14.0 or higher
- PNPM package manager

### Installation

Please refer to our detailed setup guides:

- [English Setup Guide](docs/dev_env_setup_en.md)
- [Chinese Setup Guide](docs/dev_env_setup_zh.md)

### Quick Start

```bash
# Clone the repository
git clone https://github.com/yongliucc/yongblog.git
cd yongblog

# Start the backend server
go run cmd/server/main.go

# In another terminal, start the frontend
cd ui
pnpm install
pnpm dev
```

## Project Structure

```
yongblog/
├── cmd/                # Command-line applications
│   └── server/         # Main server entry point
├── internal/           # Private application code
│   ├── api/            # API handlers
│   ├── auth/           # Authentication logic
│   ├── config/         # Configuration
│   ├── db/             # Database access
│   ├── models/         # Data models
│   └── services/       # Business logic
├── pkg/                # Public libraries
├── ui/                 # Frontend React application
│   ├── public/         # Static assets
│   └── src/            # React source code
├── docs/               # Documentation
└── scripts/            # Utility scripts
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Go](https://golang.org/)
- [React](https://reactjs.org/)
- [TypeScript](https://www.typescriptlang.org/)
- [Vite](https://vitejs.dev/)

## Contact

Yong Liu - [@yongliucc](https://github.com/yongliucc)

Project Link: [https://github.com/yongliucc/yongblog](https://github.com/yongliucc/yongblog) 