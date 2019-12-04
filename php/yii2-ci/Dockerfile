FROM twinscom/yii2:latest

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install ast-0.1.7 \
    && docker-php-ext-enable ast \
    && apk del $PHPIZE_DEPS
