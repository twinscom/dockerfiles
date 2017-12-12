FROM twinscom/php

MAINTAINER Evgeny Orekhov <orehov@web-canape.com>

RUN apk add --no-cache postgresql-dev icu-dev freetype-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ \
    && docker-php-ext-install \
        -j"$(getconf _NPROCESSORS_ONLN)" \
        pdo_pgsql \
        mbstring \
        intl \
        gd
