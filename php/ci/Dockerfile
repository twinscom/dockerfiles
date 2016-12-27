FROM php:alpine

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

ENV COMPOSER_VERSION 1.3.0

# Install Composer
RUN php /tmp/composer-setup.php \
    --no-ansi \
    --install-dir=/usr/local/bin \
    --filename=composer \
    --version=${COMPOSER_VERSION} \
    && rm -rf /tmp/composer-setup.php

# Xdebug
RUN apk add --no-cache $PHPIZE_DEPS
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN apk del $PHPIZE_DEPS
