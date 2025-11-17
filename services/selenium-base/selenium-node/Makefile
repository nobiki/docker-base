#!/bin/bash

.DEFAULT_GOAL := help
.PHONY: help

export SCALE=1 # Range: [1-9]

build: ## [Build] Node Image Build
	docker compose build node-chrome
	docker compose build node-firefox

node-chrome: ## [Up] Node Chrome Browser
	docker compose run --rm -d node-chrome | grep -Eo '^[0-9a-f]{64}$$' >> ../.running_nodes
	@cat ../.running_nodes

node-firefox: ## [Up] Node Firefox Browser
	docker compose run --rm -d node-firefox | grep -Eo '^[0-9a-f]{64}$$' >> ../.running_nodes
	@cat ../.running_nodes

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

