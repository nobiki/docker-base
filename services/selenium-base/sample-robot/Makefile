#!/bin/bash -eu

.DEFAULT_GOAL := help
.PHONY: help

build: ## [Build] Sample Robotframework Image Build
	docker-compose build selenium-robot

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | sed -e 's/Makefile://g' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

