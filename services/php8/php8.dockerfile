FROM alpine:3.12

# https://github.com/codecasts/php-alpine
# trust this project public key to trust the packages.
ADD https://packages.whatwedo.ch/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates curl bash git openssh \
    && echo "https://packages.whatwedo.ch/php-alpine/v3.12/php-8.0" >> /etc/apk/repositories \
    && apk --update add \
        php8 \
        php8-fpm \
        php8-common \
        php8-mbstring \
        php8-pcntl \
        php8-posix \
        php8-zlib \
        php8-pdo \
        php8-pdo_mysql \
        php8-mysqli \
        php8-curl \
        php8-openssl \
        php8-gettext \
        php8-bcmath \
        php8-zip \
       # php8-json \
        php8-soap \
        php8-zlib \
        php8-xml \
        php8-xmlreader \
        php8-dom \
        php8-ftp \
        php8-ctype \
        php8-gd \
        php8-intl \
        php8-session \
        php8-iconv \
        php8-exif \
        php8-redis \
        php8-opcache \
        php8-phar \
    && set -x \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data \
    && ln -s /usr/bin/php8 /usr/bin/php \
    # && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /var/cache/apk/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8", "-R", "--nodaemonize"]
WORKDIR /www