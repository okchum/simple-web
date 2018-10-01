FROM php:fpm-alpine

RUN docker-php-ext-install mysqli pdo_mysql \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

WORKDIR /www