#!/bin/sh

.DEFAULT_GOAL := help
.PHONY: help

$(eval PROJECT_NAME=$(shell cat ../.project))
export COMPOSE_PROJECT_NAME=${PROJECT_NAME}
export SCALE=1 # Range: [1-9]

build: ## [Build] Node Image Build
	docker compose build standard-chrome

standard-chrome: ## [Up] Standard Node
	docker compose run --rm -d standard-chrome 1>>../.running_nodes
	@cat ../.running_nodes

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

