FROM php:7.4.10-fpm

RUN apt-get update \
    && apt-get -y install wget \
    git \
    libpq-dev \
    libfreetype6-dev \
    libjpeg-dev \
    libmagickwand-dev \
    libpng-dev \
    libzip-dev \
    && docker-php-ext-install pdo pdo_mysql;

RUN docker-php-ext-configure gd --with-freetype --with-jpeg; \
    	docker-php-ext-install -j "$(nproc)" \
    		bcmath \
    		exif \
    		gd \
    		mysqli \
    		zip; \
    	pecl install imagick-3.4.4; \
    	docker-php-ext-enable imagick;

WORKDIR /app
