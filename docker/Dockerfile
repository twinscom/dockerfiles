FROM docker

MAINTAINER Evgeny Orekhov <orehov@web-canape.com>

RUN apk add --no-cache --virtual .build-dependencies py-pip
    && pip install docker-compose
    && apk del .build-dependencies
