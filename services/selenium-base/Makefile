#!/bin/sh

.DEFAULT_GOAL := help
.PHONY: help

include .env
export $(shell sed 's/=.*//' .env)

###################
## Network
###################
network: ## [Up] Selenium Hub -> 127.0.0.1:4444
	make -C selenium-network network

network-cleanup: ## [Down] Selenium Hub
	make -C selenium-network network-cleanup

###################
## Hub
###################
hub: ## [Up] Selenium Hub -> 127.0.0.1:4444
	make -C selenium-hub hub

hub-cleanup: ## [Down] Selenium Hub
	make -C selenium-hub hub-cleanup

###################
## Node
###################
standard-chrome: ## [Up] Standard Node
	make -C selenium-node standard-chrome

node-cleanup: ## [Down] All Node
	-cat .running_nodes | xargs docker rm -f
	echo '' > .running_nodes

node-build: ## [Build] All Node
	make -C selenium-node build

###################
## Testing
###################
standard-test: ## [Up] Standard Testing
	make standard-chrome
	# make standard-chrome-debug
	# make gpu-chrome
	sleep 10
	-./sample-test/hello
	make node-cleanup

standard-robot:
	make standard-chrome
	sleep 10
	-./sample-robot/robot -A robot.args entry.robot
	make node-cleanup

iplist: ## show container ip
	@docker network inspect ${COMPOSE_PROJECT_NAME}-net | jq -r '.[0].Containers[] | [.Name, "-->", .IPv4Address] | @csv'
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/Makefile://g' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
