.DEFAULT_GOAL := help
.SHELL := bash


.PHONY: docker-build
docker-build: ## Docker イメージをビルドします。
	docker compose build


.PHONY: launch
launch: ## Docker イメージを実行します。
	docker compose run deepstream-yolo bash


# Self-Documented Makefile
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
