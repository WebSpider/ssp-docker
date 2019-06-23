FROM php:7.3-fpm
ARG ssp_version=1.17.2
ARG ssp_checksum=0e2fd641e8cba2966437fb64591e28a73fb90bae3bc97949c60a47a5b8c1e80e
LABEL maintainer="Nils Vogels"

RUN mkdir /ssp
RUN apt update && apt install wget
RUN wget https://github.com/simplesamlphp/simplesamlphp/releases/download/v$ssp_version/simplesamlphp-$ssp_version.tar.gz && \
    echo "Comparing checksums" && \
    echo "${ssp_checksum} simplesamlphp-${ssp_version}.tar.gz" | sha256sum -c - && \
    tar xzf simplesamlphp-${ssp_version}.tar.gz -C /ssp && \
    mv /ssp/simplesamlphp-${ssp_version}/* /ssp/ && \
    rm -f /var/www/html/simplesamlphp-${ssp_version}.tar.gz && \
    rm -Rf /ssp/simplesamlphp-${ssp_version}
