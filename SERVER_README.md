# Static File Server for React Frontend

This project serves the static files generated from the React frontend using a Go HTTP server with the Gin web framework.

## Building the Frontend

To build the React frontend, run the following commands:

```bash
cd ui
npm run build
```

This will generate static files in the `ui/dist` directory.

## Setting Up Go Dependencies

If you encounter issues downloading Go dependencies, you can set up a Go package proxy:

```bash
export GOPROXY=https://goproxy.io,direct
go mod tidy
```

## Running the Server

To run the Go server that serves the static files, run the following command from the project root:

```bash
go run main.go
```

The server will start on port 8080 by default. You can change the port by setting the `PORT` environment variable:

```bash
PORT=3000 go run main.go
```

## How It Works

The Gin-based Go server serves static files from the `ui/dist` directory. For any routes that don't match a static file, it serves the `index.html` file, which is necessary for single-page applications (SPAs) with client-side routing.

## Building for Production

### Using Build Scripts

The project includes build scripts that automate the process of building both the frontend and the Go server:

#### For Unix-based systems (Linux, macOS):

```bash
# Make the script executable (first time only)
chmod +x build.sh

# Build for current platform
./build.sh

# Build for multiple platforms (Linux, Windows, macOS)
./build.sh --all
```

#### For Windows:

```cmd
# Build for current platform
build.bat

# Build for multiple platforms
build.bat --all
```

The build scripts will:
1. Build the React frontend
2. Compile the Go server with optimizations
3. Place the executable in the `bin` directory

### Manual Build

To manually build the server for production, run:

```bash
go build -ldflags="-s -w" -o server main.go
```

This will create an executable file named `server` that you can run directly:

```bash
./server
```

For production deployment, make sure to set the Gin mode to release:

```bash
GIN_MODE=release ./server
```

## Deployment

You can deploy this application to any server that can run Go applications. Simply build the frontend, build the Go server, and run the executable.

For containerized deployments, you can use a Dockerfile like this:

```dockerfile
FROM node:19 AS frontend-builder
WORKDIR /app
COPY ui/ ./
RUN npm install
RUN npm run build

FROM golang:1.23 AS backend-builder
WORKDIR /app
COPY . .
COPY --from=frontend-builder /app/dist ./ui/dist
RUN go build -o server main.go

FROM debian:bullseye-slim
WORKDIR /app
COPY --from=backend-builder /app/server .
COPY --from=frontend-builder /app/dist ./ui/dist
EXPOSE 8080
CMD ["./server"]
```

Build and run the Docker container:

```bash
docker build -t yongblog .
docker run -p 8080:8080 yongblog
``` 