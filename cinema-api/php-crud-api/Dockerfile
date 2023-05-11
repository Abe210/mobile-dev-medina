FROM php:7.1-cli-alpine3.9

RUN docker-php-ext-install pdo_mysql

WORKDIR /usr/src/adminer

ADD https://github.com/mevdschee/php-crud-api/releases/download/v2.14.19/api.php index.php

EXPOSE 80

CMD [ "php", "-S", "0.0.0.0:80" ]
