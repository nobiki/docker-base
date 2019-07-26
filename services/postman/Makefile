.DEFAULT_GOAL := help
.PHONY: help

test-newman: ## run newman
	docker run --rm -v ${PWD}/postman/collections/:/etc/newman -t postman/newman:alpine run "xxxx.postman_collection.json"

help: # [Makefileを自己文書化する](https://postd.cc/auto-documented-makefile/)
	@grep -E '^[24a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
