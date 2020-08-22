################################################################
########################## DOCKER ##############################
################################################################
####################### INSTALLATION ###########################
################################################################

init: build up

build:
	docker-compose build

set-storage-link:
	docker-compose run --rm --no-deps php-cli chmod -R 777 storage/
	docker-compose run --rm --no-deps php-cli php artisan storage:link

################################################################
################### DOCKER CONTROLLING #########################
################################################################

up:
	docker-compose up -d

down:
	docker-compose down

################################################################
################### CONTROLLING BACKEND ########################
################################################################

php:
	docker-compose run --rm --no-deps php-cli

php-bash:
	docker-compose run --rm --no-deps php-cli bash

################################################################
################## CONTROLLING FRONTEND ########################
################################################################

node:
	docker-compose exec node bash

################################################################
######################## DATABASE ##############################
################################################################

migrate:
	docker-compose run --rm --no-deps php-cli php artisan migrate:fresh --seed

################################################################
####################### LOGS/CACHE #############################
################################################################

logs-docker:
	docker-compose logs

clear-logs:
	docker-compose run --rm --no-deps php-cli rm -rf storage/logs/laravel.log

clear-cache:
	docker-compose run --rm --no-deps php-cli php artisan cache:clear

dump-autoload:
	docker-compose run --rm --no-deps php-cli composer dump-autoload

################################################################
########################## QUEUE ###############################
################################################################

queue-on: clear-cache
	docker exec -it src-php-fpm php artisan queue:work

################################################################
########################## OTHER ###############################
################################################################

chown:
	sudo chown -R $(USER) src/

routes:
	docker-compose run --rm --no-deps php-cli php artisan route:list
