.DEFAULT_GOAL := help
.PHONY: help

generate: ## hexo generate
	docker exec hexo-base hexo generate --cwd /web/site/

regenerate: ## hexo clean & hexo generate
	docker exec hexo-base hexo clean --cwd /web/site/
	docker exec hexo-base hexo generate --cwd /web/site/

container: ## compose up
	docker-compose -f ../docker-network.yml -f ./docker-compose.yml up -d

container-destroy: ## compose stop -> rm
	docker-compose -f ../docker-network.yml -f ./docker-compose.yml stop
	docker-compose -f ../docker-network.yml -f ./docker-compose.yml rm -f

container-rebuild: ## make container-destroy -> rebuild -> up
	make container-destroy
	docker rmi hexo-base
	make container

container-rerun: ## compose stop -> rm -> up
	make container-destroy
	make container

container-restart: ## compose restart
	docker-compose -f ../docker-network.yml -f ./docker-compose.yml restart

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
