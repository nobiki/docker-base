.DEFAULT_GOAL := help
.PHONY: help

PROJECT_NAME=laravel-base

laravel-project: ## laravel install + application setup
	make container
	sudo chown 1000:1000 web
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml up -d laravel-composer
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml run --rm laravel-composer composer create-project laravel/laravel /app v5.7.0
	docker-compose -p ${PROJECT_NAME} up -d laravel-composer
	docker-compose -p ${PROJECT_NAME} run --rm laravel-composer composer create-project laravel/laravel /app v5.8.17
	make laravel-setup

laravel-setup: ## application setup
	make container
	sudo chmod -R 777 web/bootstrap/cache/
	sudo chmod -R 777 web/storage/
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml run --rm laravel-node yarn --cwd /web install
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml run --rm laravel-composer composer install
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml restart
	docker-compose -p ${PROJECT_NAME} run --rm laravel-node yarn --cwd /web install
	docker-compose -p ${PROJECT_NAME} run --rm laravel-composer composer install
	docker-compose -p ${PROJECT_NAME} restart

laravel-key: ## artisan key:generate
	docker exec laravel-php php /web/artisan key:generate

assets: ## yarn run dev
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml run --rm laravel-node yarn --prefix /web run dev
	docker-compose -p ${PROJECT_NAME} run --rm laravel-node yarn --prefix /web run dev

assets-watch: ## yarn run watch
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml run --rm laravel-node yarn --prefix /web run watch
	docker-compose -p ${PROJECT_NAME} run --rm laravel-node yarn --prefix /web run watch

migrate: ## artisan migrate
	docker exec laravel-php php /web/artisan migrate

container: ## compose up
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml up -d
	docker-compose -p ${PROJECT_NAME} up -d

container-destroy: ## compose stop -> rm
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml stop
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml rm -f
	docker-compose -p ${PROJECT_NAME} stop
	docker-compose -p ${PROJECT_NAME} rm -f

container-rerun: ## compose stop -> rm -> up
	make container-destroy
	make container

container-restart: ## compose restart
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml restart
	docker-compose -p ${PROJECT_NAME} restart

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
