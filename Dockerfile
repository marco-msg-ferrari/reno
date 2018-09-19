FROM php:7.1-alpine

RUN apk add zip zlib-dev yarn git && \
    curl -o composer-setup.php https://getcomposer.org/installer && \
    curl -o composer-setup.sig https://composer.github.io/installer.sig && \
    php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) !== trim(file_get_contents('composer-setup.sig'))) { unlink('composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" && \
    php composer-setup.php --quiet && \
    mv composer.phar /usr/local/bin/composer


RUN docker-php-ext-install mysqli pdo pdo_mysql pcntl zip


WORKDIR /code

EXPOSE 8002:8000

CMD ["php", "-S", "0.0.0.0:8000", "-t",  "/code/public/"]
