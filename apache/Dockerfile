FROM php:5.6.30-apache
#FROM php:7.0.5-apache

MAINTAINER Vladyslav Kurmaz <vladislav.kurmaz@gmail.com>

ARG SERVER_NAME
ENV SERVER_NAME=$SERVER_NAME

RUN export DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg-divert --local --rename --add /sbin/initctl

# Use local cached debs from host (saves your bandwidth!)
# Change ip below to that of your apt-cacher-ng host
# Or comment this line out if you do not wish to use caching
ADD ./dist/71-apt-cacher-ng /etc/apt/apt.conf.d/71-apt-cacher-ng

RUN apt-get -y update && \
    apt-get install -y \
    curl \
    libcurl4-gnutls-dev \
    libpng-dev \
    libpq-dev \
    libxml2-dev \
    libtidy-dev \
    unzip \
    mc


RUN docker-php-ext-install -j$(nproc) \
  curl \
  gd \
  pdo_pgsql \
  zip \
  tidy \
  xml


RUN a2enmod rewrite

ADD http://releases.taotesting.com/TAO_3.1.0-RC7_build.zip /tmp/TAO_3.1.0-RC7_build.zip
ADD https://github.com/mathjax/MathJax/archive/2.7.0.zip /tmp/2.7.0.zip

WORKDIR /tmp

RUN unzip -q TAO_3.1.0-RC7_build.zip; \
    mv TAO_3.1.0-RC7_build web; \
    mv web /home/; \
    unzip -q 2.7.0.zip; \
    mv MathJax-2.7.0/* /home/web/taoQtiItem/views/js/mathjax/; \
    chown -R www-data.www-data /home/web

ADD ./dist/apache.conf /etc/apache2/sites-enabled/000-default.conf
RUN sed -i -e "s/SERVER_NAME/${SERVER_NAME}/g" /etc/apache2/sites-enabled/000-default.conf

ADD ./dist/php.ini /usr/local/etc/php/

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
