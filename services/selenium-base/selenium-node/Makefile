#!/bin/sh

.DEFAULT_GOAL := help
.PHONY: help

$(eval PROJECT_NAME=$(shell cat ../.project))
export COMPOSE_PROJECT_NAME=${PROJECT_NAME}
# export SCALE=2 # Range: [1-9]

build: ## [Build] Node Image Build
	docker-compose build standard-chrome
	docker-compose build standard-chrome-debug
	docker-compose build gpu-chrome

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

