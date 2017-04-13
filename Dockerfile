FROM php:7.0.5-apache

MAINTAINER Nick Sorrell <nick@cint.io>

RUN export DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg-divert --local --rename --add /sbin/initctl

# Use local cached debs from host (saves your bandwidth!)
# Change ip below to that of your apt-cacher-ng host
# Or comment this line out if you do not wish to use caching
ADD 71-apt-cacher-ng /etc/apt/apt.conf.d/71-apt-cacher-ng

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

WORKDIR /tmp

RUN unzip TAO_3.1.0-RC7_build.zip; mv TAO_3.1.0-RC7_build web; mv web /home/; chown -R www-data.www-data /home/web

ADD apache.conf /etc/apache2/sites-enabled/000-default.conf
ADD php.ini /usr/local/etc/php/

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
