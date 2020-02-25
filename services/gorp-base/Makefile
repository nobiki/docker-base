#!/bin/bash -eu
include .env
export $(shell sed 's/=.*//' .env)

.DEFAULT_GOAL := help
.PHONY: help

create-react-app: ## setting up create-react-app
	./yarn init
	./yarn add create-react-app
	./yarn -s run create-react-app ${ROOTDIR}

start-react-app: ## start react-app
	./yarn --cwd ${ROOTDIR} start

iplist: ## show container ip
	@docker network inspect ${COMPOSE_PROJECT_NAME}_default | jq -r '.[0].Containers[] | [.Name, "-->", .IPv4Address] | @csv' | column -t -s "," | xargs -ICONTAINER echo "- CONTAINER"
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/Makefile://g' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
