.DEFAULT_GOAL := help
.PHONY: help up exec stop test

BUILD_FLAG := $(if $(build),--build,)

up: ## Start the containers
	docker-compose up -d $(BUILD_FLAG)

exec: ## Enter the container
	docker-compose exec app bash

stop: ## Stop the containers
	docker-compose down

test: ## Run the tests
	docker-compose exec app pytest

help: ## Print these help docs
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
