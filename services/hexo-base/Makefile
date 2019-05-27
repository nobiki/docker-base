.DEFAULT_GOAL := help
.PHONY: help

PROJECT_NAME=hexo-base

html: ## container-restart
	make container-restart

container: ## compose up
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml up -d
	docker-compose -p ${PROJECT_NAME} up -d

container-destroy: ## compose stop -> rm
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml stop
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml rm -f
	docker-compose -p ${PROJECT_NAME} stop
	docker-compose -p ${PROJECT_NAME} rm -f

container-rebuild: ## make container-destroy -> rebuild -> up
	make container-destroy
	docker rmi hexo-base
	make container

container-rerun: ## compose stop -> rm -> up
	make container-destroy
	make container

container-restart: ## compose restart
	# docker-compose -f ../docker-network.yml -f ./docker-compose.yml restart
	docker-compose -p ${PROJECT_NAME} restart

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
