FROM php:7.1-fpm-alpine

RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev libzip-dev icu-dev gnu-libiconv git \
  && docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ && \
  NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
  && docker-php-ext-install -j${NPROC} gd \
  && docker-php-ext-install zip \
  && docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-install pcntl \
  && docker-php-ext-install mbstring mysqli pdo_mysql opcache intl sockets \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  ## Development
  && apk add --no-cache bash fish
  #&& curl -L https://get.oh-my.fish | fish \
  #&& fish \
  #&& omf install colored-man-pages enlarge_your_git_alias fzf gi z

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

WORKDIR /www