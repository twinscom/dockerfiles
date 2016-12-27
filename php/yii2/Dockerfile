FROM twinscom/php

RUN apk add --no-cache \
    postgresql-dev \
    icu-dev

RUN docker-php-ext-install \
    pdo_pgsql \
    mbstring \
    intl
