FROM alpine:3.12

# https://github.com/codecasts/php-alpine
# trust this project public key to trust the packages.
ADD https://packages.whatwedo.ch/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates curl bash git openssh \
    && echo "https://packages.whatwedo.ch/php-alpine/v3.12/php-7.4" >> /etc/apk/repositories \
    && apk --update add \
        php \
        php-fpm \
        php-mbstring \
        php-pcntl \
        php-posix \
        php-zlib \
        php-pdo \
        php-pdo_mysql \
        php-mysqli \
        php-curl \
        php-openssl \
        php-gettext \
        php-bcmath \
        php-zip \
        php-json \
        php-soap \
        php-zlib \
        php-xml \
        php-xmlreader \
        php-dom \
        php-ftp \
        php-ctype \
        php-gd \
        php-intl \
        php-session \
        php-sockets \
        php-iconv \
        php-exif \
        php-redis \
        php-opcache \
        php-phar \
    && set -x \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /var/cache/apk/ \
    && apk add --no-cache bash fish


EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]
WORKDIR /www