.DEFAULT_GOAL := help
.PHONY: help

PROJECT_NAME=docker-base

container: ## コンテナのビルド/実行
	# docker-compose -f ../docker-network.yml -f docker-compose.yml up -d
	docker-compose -p ${PROJECT_NAME} up -d

container-destroy: ## コンテナの破棄
	# docker-compose -f ../docker-network.yml -f docker-compose.yml stop
	# docker-compose -f ../docker-network.yml -f docker-compose.yml rm -f
	docker-compose -p ${PROJECT_NAME} stop
	docker-compose -p ${PROJECT_NAME} rm -f

container-rebuild: ## コンテナの再作成＋イメージの再ビルド
	make container-destroy
	docker rmi base-container
	make container

container-rerun: ## コンテナの再作成
	make container-destroy
	make container

tty: ## コンテナに入る
	docker exec -it -u root -w /apps base-container bash

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
