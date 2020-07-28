#!/usr/bin/make

init:
	docker-compose up -d \
	&& docker-compose exec app composer install \
	&& cp .env.example .env \
	&& docker-compose exec app php artisan key:generate \
    && docker-compose exec app php artisan storage:link \
    && docker-compose exec app php artisan migrate --seed

build:
	docker-compose build

start:
	docker-compose up -d

stop:
	docker-compose down

bash:
	docker-compose exec app bash

composer-install:
	docker-compose exec app composer install

composer-dump-autoload:
	docker-compose exec app composer dump-autoload

migrate:
	docker-compose exec app php artisan migrate

seed:
	docker-compose exec app php artisan db:seed

migrate-refresh:
	docker-compose exec app php artisan migrate:refresh --seed

tinker:
	docker-compose exec app php artisan tinker

phpcs:
	docker-compose exec app vendor/bin/phpcs

phpmd:
	docker-compose exec app vendor/bin/phpmd app text ruleset.xml

phpunit:
	docker-compose exec app vendor/bin/phpunit

yarn-watch:
	docker-compose exec app yarn watch
