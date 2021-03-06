CURRENT_DIRECTORY := $(shell pwd)

start:  
	@docker-compose up -d

build:
	@docker-compose build;

clean:  
	@docker-compose rm --force

stop:  
	@docker-compose stop

status:  
	@docker-compose ps

cli:  
	@docker-compose run --rm web bash

log:  
	@tail -f logs/nginx-error.log

restart:  
	@docker-compose stop
	@docker-compose start

make-data:
	@docker create --name crm_data -v /var/lib/mysql debian:latest /bin/true

.PHONY: clean start stop status cli log restart make-data build
