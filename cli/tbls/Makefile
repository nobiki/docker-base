.DEFAULT_GOAL := help
.PHONY: help

diagram:
	sudo rm -rf ./work/ && mkdir work
	docker-compose run --rm tbls doc mysql://root:password@tbls-db:3306/world

web:
	docker-compose up -d tbls-web

database:
	docker-compose stop tbls-db
	docker-compose rm -f tbls-db
	docker-compose up -d tbls-db

iplist:
	@docker network inspect schemaspy_default | jq -r '.[0].Containers[] | [.Name, "-->", .IPv4Address] | @csv' | column -t -s "," | xargs -ICONTAINER echo "- CONTAINER"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sed -e 's/Makefile://g' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

