FROM php:7.2.12-fpm-alpine

RUN docker-php-ext-install pdo_mysql mysqli mbstring
