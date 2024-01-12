FROM composer:2.5.8 as composer
FROM node:16-alpine as node
FROM php:8.1-fpm-alpine

MAINTAINER Maurizio Brioschi <info@mauriziobrioschi.com>

RUN echo "UTC" > /etc/timezone
RUN apk add --no-cache zip \
    unzip \
    curl \
    supervisor \
    vim \
    git \
    libzip-dev \
    freetype \
    libpng \
    libjpeg-turbo \
    freetype-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    icu-dev \
    linux-headers \
    shadow \
     $PHPIZE_DEPS \
     bash && \
     sed -i 's/bin\/ash/bin\/bash/g' /etc/passwd

RUN apk update && apk add --no-cache php81-opcache \
    php81-zip \
    php81-phar \
    php81-iconv \
    php81-cli \
    php81-curl \
    php81-openssl \
    php81-mbstring \
    php81-tokenizer \
    php81-fileinfo \
    php81-json \
    php81-xml \
    php81-xmlwriter \
    php81-simplexml \
    php81-dom \
    php81-pdo_mysql \
    php81-pdo_sqlite \
    php81-tokenizer \
    php81-pecl-redis \
    php81-exif

RUN set -x ; \
    groupmod -o -g 1000 www-data && \
    usermod -o -u 1000 -g www-data www-data

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg && \
  docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install intl pdo_mysql zip bcmath  exif mysqli opcache

RUN cd /tmp && \
    git clone -b release/6.0.0RC2 https://github.com/phpredis/phpredis.git && \
    cd phpredis && \
    phpize && ./configure && \
    make && make install

RUN docker-php-ext-enable redis.so


COPY php-fpm.d/www.conf /usr/local/etc/php-fpm.d/
COPY conf/opcache.ini /etc/php81/conf.d/
COPY conf/php.ini-production /usr/local/etc/php/php.ini
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/bin /usr/local/bin

RUN mkdir /var/www/html/laravel-scaffolding

WORKDIR /var/www/html/laravel-scaffolding

COPY src .

RUN chown -R www-data:www-data /var/www/html/laravel-scaffolding && chmod -R 770 /var/www/html/laravel-scaffolding

USER www-data

RUN composer install --optimize-autoloader --no-dev && npm install && npm run build

EXPOSE 9000

CMD ["php-fpm", "-F"]
