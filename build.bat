@echo off
setlocal enabledelayedexpansion

echo [INFO] Building YongBlog...

:: Check if output directory exists, create if not
if not exist bin mkdir bin

:: Build frontend
echo [INFO] Building React frontend...
cd ui
call npm run build
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Frontend build failed!
    exit /b 1
)
cd ..
echo [INFO] Frontend built successfully!

:: Set Go environment variables
set GOPROXY=https://goproxy.io,direct
set CGO_ENABLED=0

:: Build for current platform
echo [INFO] Building Go server...
go build -ldflags="-s -w" -o bin\yongblog.exe main.go
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Go build failed!
    exit /b 1
)
echo [INFO] Server built successfully! Binary located at bin\yongblog.exe

:: Optional: Build for multiple platforms
if "%1"=="--all" (
    echo [INFO] Building for multiple platforms...
    
    :: Linux (amd64)
    echo [INFO] Building for Linux (amd64)...
    set GOOS=linux
    set GOARCH=amd64
    go build -ldflags="-s -w" -o bin\yongblog-linux-amd64 main.go
    
    :: macOS (amd64)
    echo [INFO] Building for macOS (amd64)...
    set GOOS=darwin
    set GOARCH=amd64
    go build -ldflags="-s -w" -o bin\yongblog-darwin-amd64 main.go
    
    :: macOS (arm64)
    echo [INFO] Building for macOS (arm64)...
    set GOOS=darwin
    set GOARCH=arm64
    go build -ldflags="-s -w" -o bin\yongblog-darwin-arm64 main.go
    
    echo [INFO] All platforms built successfully!
)

echo [INFO] Build process completed!
echo Run the server with: bin\yongblog.exe
echo For production mode: set GIN_MODE=release ^& bin\yongblog.exe
echo For debug mode: set GIN_MODE=debug ^& bin\yongblog.exe 