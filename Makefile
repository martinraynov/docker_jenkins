M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######################
### MAIN FUNCTIONS ###
######################

.PHONY: start
start: ## Start the Jenkins docker container
	$(info $(M) Starting an instance of jenkins)
	@docker stack rm jenkins
	@docker stack deploy -c ./docker/docker-compose-swarm.yml jenkins

.PHONY: stop
stop: ## Stopping running jenkins instances
	$(info $(M) Stopping jenkins instance)
	@docker stack rm jenkins

.PHONY: build
build: ## Build the local jenkins image
	$(info $(M) Building local jenkins image : localhost/jenkins:lts)
	@docker build ./docker -t localhost/jenkins:lts

.DEFAULT_GOAL := help