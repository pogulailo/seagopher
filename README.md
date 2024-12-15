# Docker for Go: Perfect Setup for Development, Testing and Production

This repository provides a simple and effective Docker setup for **Go projects**. It is designed to streamline development with best practices for structure and container configuration.

## Features

- **Hot-reloading** with Air for efficient development.
- Separate configurations for **development** and **production**.
- Simplified commands with a **Makefile**.

## Project Structure

```plaintext
project-directory/
  app/                # Main application code
  docker/             # Infrastructure configuration
    development/      # Development environment configuration
      app/            # Application service files
        Dockerfile    # Dockerfile for the app
      docker-compose.yml # Docker Compose configuration for development
    production/       # Production environment configuration
  var/                # Temporary data (e.g., database files)
  .gitignore          # Files and directories to ignore in the repository
  Makefile            # Simplified commands for working with Docker
```

## How to Use

1. **Clone the Repository:**
   ```bash
   git clone <repository-url>
   cd project-directory
   ```

2. **Build the Docker Environment:**
   ```bash
   make build
   ```

3. **Start the Development Environment:**
   ```bash
   make start
   ```

4. **Stop the Environment:**
   ```bash
   make stop
   ```

## Configuration Details

### Dockerfile

```dockerfile
FROM golang:1.23.2-alpine

RUN apk add --no-cache git curl bash \
    && curl -fLo install.sh https://raw.githubusercontent.com/cosmtrek/air/master/install.sh \
    && chmod +x install.sh \
    && sh install.sh \
    && cp ./bin/air /bin/air

WORKDIR /app
COPY ./app/go.mod ./app/go.sum ./
RUN go mod download
COPY ./app ./
EXPOSE 8080
CMD ["air"]
```

### Docker Compose

```yaml
services:
  app:
    build:
      context: ./../../
      dockerfile: docker/development/app/Dockerfile
    volumes:
      - ./../../app:/app
    environment:
      GO_ENV: development
    ports:
      - '8080:8080'
```

### Makefile

```makefile
build:
	docker compose -f ./docker/development/docker-compose.yml build

start:
	docker compose -f ./docker/development/docker-compose.yml up

stop:
	docker compose -f ./docker/development/docker-compose.yml down
```

## Notes

- **Development-focused:** Production configurations should be adapted for specific projects.
- Includes **Air** for automatic code reloading during development.

## Summary

This setup simplifies Docker integration for Go projects, ensuring consistency and ease of use. Fork or clone this repository and customize it for your needs.
