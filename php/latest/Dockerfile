FROM php:fpm-alpine

MAINTAINER Evgeny Orekhov <orehov@web-canape.com>

################################################################################
# Composer                                                                     #
################################################################################

# Packages
RUN apk add --no-cache --virtual .composer-dependencies \
    unzip \
    git \
    openssh-client

# Register the COMPOSER_HOME environment variable
ENV COMPOSER_HOME /composer

# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

# Setup the Composer installer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"

ENV COMPOSER_VERSION 1.7.2

# Install Composer
RUN php /tmp/composer-setup.php \
    --no-ansi \
    --install-dir=/usr/local/bin \
    --filename=composer \
    --version=${COMPOSER_VERSION} \
    && rm -rf /tmp/composer-setup.php

################################################################################
# SSH                                                                          #
################################################################################

RUN mkdir /root/.ssh/ \
    && ssh-keyscan github.com gitlab.com bitbucket.org \
    >> /root/.ssh/known_hosts

################################################################################
# Health check                                                                 #
################################################################################

RUN apk add --no-cache fcgi

HEALTHCHECK --interval=10s --timeout=3s \
    CMD \
    SCRIPT_NAME=/ping \
    SCRIPT_FILENAME=/ping \
    REQUEST_METHOD=GET \
    cgi-fcgi -bind -connect 127.0.0.1:9000 || exit 1
