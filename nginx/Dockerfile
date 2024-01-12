FROM nginx:1.23.3-alpine

MAINTAINER Maurizio Brioschi <info@mauriziobrioschi.com>

RUN apk update \
    && apk upgrade \
    && apk --update add logrotate \
    && apk add --no-cache openssl \
    && apk add --no-cache bash

RUN set -x ; \
    addgroup -g 82 -S www-data ; \
    adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

RUN addgroup nginx www-data

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

WORKDIR /var/www/html/laravel-scaffolding

