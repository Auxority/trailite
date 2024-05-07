default: help

.PHONY: help
help: # Show this help message
	@awk -F ':|#' '/^[a-zA-Z0-9 -]+:.*#/ { print "\033[1;32m" $$1 "\033[00m:" $$3 }' Makefile | sort

.PHONY: build
build: # Build the docker image
	@docker compose build

.PHONY: run
run: # Run the docker container
	@docker compose up -d --remove-orphans

.PHONY: stop
stop: # Stop the docker container
	@docker compose stop

.PHONY: restart
restart: # Restart the docker container
	@docker compose restart

.PHONY: clean
clean: # Stop and remove the docker container
	@docker compose down --remove-orphans

.PHONY: debug
debug: # Run the docker container in debug mode
	@docker compose up --build

.PHONY: logs
logs: # Show the logs of the docker container
	@docker compose logs --since 5m -n 20 -f

.PHONY: sh
sh: # Open a shell in the docker container
	@docker compose exec app sh