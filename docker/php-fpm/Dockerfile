FROM php:7.4.8-fpm

RUN apt-get update \
    && apt-get -y install wget \
    git \
    libpq-dev \
    && docker-php-ext-install pdo pdo_mysql

WORKDIR /app
