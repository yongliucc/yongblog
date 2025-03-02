package main

import (
	"log"
	"net/http"
	"os"
	"strings"

	"github.com/gin-gonic/gin"
)

func main() {
	// Set the server mode based on environment variable or default to release mode
	mode := strings.ToLower(os.Getenv("GIN_MODE"))
	if mode == "debug" {
		gin.SetMode(gin.DebugMode)
	} else {
		gin.SetMode(gin.ReleaseMode)
	}

	// Create a default gin router
	router := gin.Default()

	// Log middleware (only in debug mode)
	if mode == "debug" {
		router.Use(func(c *gin.Context) {
			log.Printf("Request: %s %s", c.Request.Method, c.Request.URL.Path)
			c.Next()
			log.Printf("Response: %d", c.Writer.Status())
		})
	}

	// Serve static files from the UI build directory
	router.StaticFS("/assets", http.Dir("./ui/dist/assets"))
	router.StaticFile("/favicon.ico", "./ui/dist/favicon.ico")
	
	// Handle any routes that don't match static files
	router.NoRoute(func(c *gin.Context) {
		if mode == "debug" {
			log.Printf("No route found for %s, serving index.html", c.Request.URL.Path)
		}
		// Serve the index.html for any unmatched routes (for SPA routing)
		c.File("./ui/dist/index.html")
	})

	// Get port from environment variable or use default
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	// Start the server
	log.Printf("Server starting on port %s in %s mode...\n", port, gin.Mode())
	if err := router.Run(":" + port); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
} 