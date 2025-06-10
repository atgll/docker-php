#!/usr/bin/make

MAKEFLAGS += --no-print-directory

#############################################################################################
### Utils goals                                                                           ###
#############################################################################################

.PHONY: confirm
confirm:
	@echo -n "Are you sure? [y/n] " && \
		read ans && if [ $${ans:-'n'} = 'y' ]; then \
		echo -e ""; \
		exit 0; \
	else \
		echo -e "\n\033[31mAction canceled\033[0m"; \
		exit 1; \
	fi

.PHONY: banner
banner:
	@echo -e $(message)

.PHONY: up
up:
	docker compose up -d

.PHONY : stop
stop:
	docker compose stop

.PHONY: start
start:
	docker compose start



.PHONY:restart
restart:
	@make banner message="Seguro restart?" && make confirm
	make stop
	make start


.PHONY: build
build:
	docker compose up --build -d

.PHONY: down
down:
	@make banner message="Seguro que quiere hacer down?" && make confirm
	docker compose down



.PHONY: devup
devup:
	docker compose -f docker-compose.dev.yaml up -d

.PHONY: devbuild
devbuild:
	docker compose -f docker-compose.dev.yaml up --build -d

