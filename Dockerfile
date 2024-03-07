# Utilize a imagem oficial do PHP
FROM php:7.4-fpm

# Atualize os pacotes e instale dependências necessárias
RUN apt-get update && \
    apt-get install -yqq --no-install-recommends libpng-dev libjpeg-dev libfreetype6-dev zip unzip && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql soap

# Instale as dependências do Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Defina o diretório de trabalho
WORKDIR /var/www

