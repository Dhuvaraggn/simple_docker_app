FROM php:8.1-apache

ENV dbcontainername=${DBCONTNAME}
ENV username = ${USERNAME}
ENV password = ${PASSWORD}
ENV dbname = ${DBNAME}

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
COPY ./index.php /var/www/html/
COPY ./entrypoint /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint
EXPOSE 80
WORKDIR /var/www/html/
ENTRYPOINT [ "/usr/local/bin/entrypoint" ]