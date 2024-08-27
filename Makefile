# Makefile

# Build the frontend project and ensure the Docker image is up-to-date
frontend:
	pnpm i && pnpm build

fitool-server:
	go build -o fitool-server

# Deploy the containers using docker-compose
deploy:
	docker-compose up -d

stop:
	docker-compose down