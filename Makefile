build:
	docker compose -f ./docker/development/docker-compose.yml build

start:
	docker compose -f ./docker/development/docker-compose.yml

down:
	docker compose -f ./docker/development/docker-compose.yml down
