# PHP 7.2.14
# Reference of docker image: https://github.com/docker-library/docs/blob/master/php/README.md
# Version 0.1

FROM php:7.2.14-cli-stretch

MAINTAINER Core <hfreedomx@gmail.com>

# Setting Time Zone to the dependence servers
ENV TZ=Asia/Tokyo

ENV ROOT_FOLDER /

WORKDIR /applications
RUN mkdir -p /applications/logs
# The entry of the application to be executed by php
RUN mkdir -p /applications/entry
WORKDIR entry

# Install Core extensions of PHP
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Install xdebug by pecl
RUN pecl install xdebug \
	&& docker-php-ext-enable xdebug

#ENV PHP_INI_FILE /usr/local/etc/php
COPY php.ini "$PHP_INI_DIR/php.ini"

# Publishing the 9001 port to contect to Xdebug port.
EXPOSE 9001

# '-v {local path:volumn path}' to bind mount on container
VOLUME ['/applications/entry']

# Checking whether the  mount is binded correctly
#ENTRYPOINT ["ls", "/applications/entry"]

CMD ["php", "-f"]
