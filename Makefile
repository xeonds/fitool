# Makefile

# Build the frontend project and ensure the Docker image is up-to-date
build:
	pnpm run build
	docker build -t fit-server:latest .

# Deploy the containers using docker-compose
deploy:
	docker-compose up -d
