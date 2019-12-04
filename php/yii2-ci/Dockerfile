FROM twinscom/yii2:latest

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install ast-1.0.5 \
    && docker-php-ext-enable ast \
    && apk del $PHPIZE_DEPS
