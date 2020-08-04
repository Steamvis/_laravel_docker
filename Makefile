init: build up set-storage-link logs-docker

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

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
	docker-compose run --rm --no-deps php-fpm rm -rf storage/logs/laravel.log

clear-cache:
	docker-compose run --rm --no-deps php-fpm php artisan cache:clear

dump-autoload:
	docker-compose run --rm --no-deps php-fpm composer dump-autoload

set-storage-link:
	docker-compose run --rm --no-deps php-fpm chmod -R 777 storage/
	docker-compose run --rm --no-deps php-fpm php artisan storage:link


################################################################
########################## OTHER ###############################
################################################################

chown:
	sudo chown -R $(USER) src/

routes:
	docker-compose run --rm --no-deps php-cli php artisan route:list

