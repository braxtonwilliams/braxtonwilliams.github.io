.PHONY: help serve start stop docker-up docker-down docker-build docker-logs

help:
	@echo "Available commands:"
	@echo "  make serve         - Start the local development server"
	@echo "  make start         - Alias for serve"
	@echo "  make docker-up     - Build and start the Traefik-fronted nginx container"
	@echo "  make docker-down   - Stop and remove the container"
	@echo "  make docker-build  - Rebuild the Docker image"
	@echo "  make docker-logs   - Tail the container logs"

serve:
	@echo "Starting server on http://localhost:3133"
	@echo "Press Ctrl+C to stop"
	@python3 -m http.server 3133

start: serve

stop:
	@echo "To stop the server, press Ctrl+C in the terminal where it's running"

docker-up:
	@docker compose up -d --build

docker-down:
	@docker compose down

docker-build:
	@docker compose build

docker-logs:
	@docker compose logs -f