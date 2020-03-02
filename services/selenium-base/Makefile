#!/bin/sh

.DEFAULT_GOAL := help
.PHONY: help

include .env
export $(shell sed 's/=.*//' .env)

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
	docker-compose run --rm -d standard-chrome 1>>.running_nodes
	@cat .running_nodes

standard-chrome-debug: ## [Up] Standard Node(Debug)
	docker-compose run --rm -d standard-chrome-debug 1>>.running_nodes
	@cat .running_nodes

gpu-chrome: ## [Up] GPU Node
	docker run -d --rm --net ${COMPOSE_PROJECT_NAME}_default --gpus all --env-file environments/gpu-chrome.env -e DISPLAY=:0 -v /tmp/.X11-unix/:/tmp/.X11-unix:rw --name gpu-chrome docker.pkg.github.com/nobiki/selenium-base/gpu-chrome:latest | xargs -ICID echo gpu-chrome-CID | tee -a .running_nodes | xargs -IRENAME docker rename gpu-chrome RENAME
	@cat .running_nodes

node-cleanup: ## [Down] All Node
	-cat .running_nodes | awk '/^${COMPOSE_PROJECT_NAME}/' | xargs docker rm -f
	echo '' > .running_nodes

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
	@docker network inspect ${COMPOSE_PROJECT_NAME}_default | jq -r '.[0].Containers[] | [.Name, "-->", .IPv4Address] | @csv' | column -t -s "," | xargs -ICONTAINER echo "- CONTAINER"
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/Makefile://g' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
