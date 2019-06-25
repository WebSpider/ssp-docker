FROM php:7-fpm
ARG ssp_version=1.17.2
ARG ssp_checksum=0e2fd641e8cba2966437fb64591e28a73fb90bae3bc97949c60a47a5b8c1e80e
LABEL maintainer="Nils Vogels"

RUN apt update && apt dist-upgrade -y && apt install wget
RUN wget https://github.com/simplesamlphp/simplesamlphp/releases/download/v$ssp_version/simplesamlphp-$ssp_version.tar.gz && \
    echo "Comparing checksums" && \
    echo "${ssp_checksum} simplesamlphp-${ssp_version}.tar.gz" | sha256sum -c - && \
    tar xzf simplesamlphp-${ssp_version}.tar.gz -C /var/www/html && \
    ln -s /var/www/html/simplesamlphp-${ssp_version} /var/www/html/simplesamlphp && \
    rm -f /var/www/html/simplesamlphp-${ssp_version}.tar.gz && \
    apt-get autoremove && apt-get autoclean && apt-get clean

ADD files/php.ini /usr/local/etc/php/conf.d/
ADD files/simplesaml-authsources.php /var/www/html/simplesamlphp/config/authsources.php
ADD files/simplesaml-config.php /var/www/html/simplesamlphp/config/config.php

VOLUME /var/www/html/

