#!/bin/sh

.DEFAULT_GOAL := help
.PHONY: help

hub: ## [Up] Selenium Hub -> 127.0.0.1:4444
	docker-compose up -d selenium-hub
	@echo "[Up] Selenium Hub -> 127.0.0.1:4444"

hub-cleanup: ## [Down] Selenium Hub
	docker-compose stop selenium-hub
	docker-compose rm -f selenium-hub

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

