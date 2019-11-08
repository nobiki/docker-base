.DEFAULT_GOAL := help
.PHONY: help

build: ## [1] Build gpu-base Image
	docker build -t gpu-base:latest .

allow-xhost: ## [2] xhost Setup
	xhost + local:root

smi: ## nvidia-smi
	docker run --rm --gpus all gpu-base:latest nvidia-smi

glmark: ## glmark2
	docker run --rm --gpus all -e DISPLAY=:0 -v /tmp/.X11-unix/:/tmp/.X11-unix gpu-base:latest glmark2

tty: ## bash
	docker run --rm --gpus all -e DISPLAY=:0 -v /tmp/.X11-unix/:/tmp/.X11-unix -it gpu-base:latest /bin/bash

tty-nogpu: ## bash without GPU
	docker run --rm            -e DISPLAY=:0 -v /tmp/.X11-unix/:/tmp/.X11-unix -it gpu-base:latest bash

display-list:
	(cd /tmp/.X11-unix && for x in X*; do echo ":${x#X}"; done)

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

