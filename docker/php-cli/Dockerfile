FROM php:7.4.8-cli

RUN apt-get update \
    && apt-get -y install wget \
    git \
    libpq-dev \
    zip \
    && docker-php-ext-install pdo pdo_mysql

RUN pecl install \
    redis

RUN docker-php-ext-enable \
    redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer --quiet \
    && rm -rf /root/.composer/cache

WORKDIR /app
