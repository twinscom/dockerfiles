FROM php:7-fpm-alpine

MAINTAINER Artem Radchenkov <armit@twinscom.ru>

################################################################################
# ADDITIONAL EXTENSIONS
################################################################################

RUN apk add --no-cache \
        postgresql-dev \
        icu-dev \
        freetype-dev \
        oniguruma-dev \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" pdo_pgsql intl gd \
    && docker-php-source delete
