#!/bin/bash -eu

.DEFAULT_GOAL := help
.PHONY: help

$(eval TS := $(shell date +%Y%m%d%H%M%S%N))

create-react-app: ## settin up create-react-app
	./yarn init
	./yarn add create-react-app
	#./yarn -s run create-react-app appname
	#./yarn --cwd appname start


help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
