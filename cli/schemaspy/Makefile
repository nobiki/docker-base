.DEFAULT_GOAL := help
.PHONY: help

diagram:
	docker-compose run --rm schemaspy -all

web:
	docker-compose up -d schemaspy-web

database:
	docker-compose stop schemaspy-db
	docker-compose rm -f schemaspy-db
	docker-compose up -d schemaspy-db

iplist:
	@docker network inspect schemaspy_default | jq -r '.[0].Containers[] | [.Name, "-->", .IPv4Address] | @csv' | column -t -s "," | xargs -ICONTAINER echo "- CONTAINER"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/Makefile://g' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

