# Development Environment Setup Guide

This guide provides instructions for setting up the development environment for the YongBlog project on multiple platforms: Ubuntu 22.04 running on WSL in Windows, standalone Ubuntu 22.04, or macOS.

## Prerequisites

- One of the following operating systems:
  - Windows 10/11 with WSL2 installed and Ubuntu 22.04 LTS
  - Ubuntu 22.04 LTS (standalone)
  - macOS

## Setup Steps

### 1. Create Application Directory

#### For Ubuntu (WSL or standalone):

```bash
# Create applications directory
sudo mkdir -p /opt/apps
cd /opt/apps
```

#### For macOS:

```bash
# Create applications directory
sudo mkdir -p /opt/apps
cd /opt/apps
```

### 2. Install Go

#### For Ubuntu (WSL or standalone):

```bash
# Download Go 1.23.6
wget https://golang.google.cn/dl/go1.23.6.linux-amd64.tar.gz

# Extract Go to /opt/apps
sudo tar -C /opt/apps -xzf go1.23.6.linux-amd64.tar.gz

# Clean up the downloaded archive
rm go1.23.6.linux-amd64.tar.gz
```

#### For macOS:

```bash
# Download Go 1.23.6
curl -O https://golang.google.cn/dl/go1.23.6.darwin-amd64.tar.gz

# Extract Go to /opt/apps
sudo tar -C /opt/apps -xzf go1.23.6.darwin-amd64.tar.gz

# Clean up the downloaded archive
rm go1.23.6.darwin-amd64.tar.gz

# Alternative: Install using Homebrew
# brew install go
```

### 3. Configure Environment Variables

Add the following to your `~/.bashrc` file (for Ubuntu) or `~/.zshrc` file (for macOS):

```bash
# Go environment variables
export GOROOT=/opt/apps/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
```

Apply the changes:

```bash
# For Ubuntu
source ~/.bashrc

# For macOS
source ~/.zshrc
```

### 4. Create Project Directory

```bash
# Create projects directory
mkdir -p /data/projects
cd /data/projects

# Create and navigate to the yongblog project directory
mkdir yongblog
cd yongblog
```

### 5. Initialize Go Module

```bash
# Initialize Go module
go mod init github.com/yongliucc/yongblog
```

### 6. Install Node.js via NVM

```bash
# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Reload shell configuration
source ~/.bashrc  # Ubuntu
# or
source ~/.zshrc   # macOS

# Install Node.js 22.14.0
nvm install 22.14.0

# Set as default Node.js version
nvm use 22.14.0
```

### 7. Install PNPM and Create UI Project

```bash
# Install PNPM globally
npm install -g pnpm

# Create React TypeScript project using Vite
pnpm create vite ui --template react-ts

# Navigate to the UI directory
cd ui

# Install dependencies
pnpm install
```

## Verification

Verify your installation:

```bash
# Check Go version
go version

# Check Node.js version
node -v

# Check PNPM version
pnpm -v
```

## Project Structure

After completing the setup, your project structure should look like:

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

## Next Steps

- Start developing the backend using Go
- Develop the frontend UI using React and TypeScript
- Configure the project for deployment 