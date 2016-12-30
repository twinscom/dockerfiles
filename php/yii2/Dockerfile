FROM twinscom/php

MAINTAINER Evgeny Orekhov <orehov@web-canape.com>

RUN apk add --no-cache postgresql-dev icu-dev \
    && docker-php-ext-install pdo_pgsql mbstring intl
