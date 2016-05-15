FROM php:7.0.5-apache

MAINTAINER Nick Sorrell <nick@cint.io>

RUN export DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg-divert --local --rename --add /sbin/initctl

# Use local cached debs from host (saves your bandwidth!)
# Change ip below to that of your apt-cacher-ng host
# Or comment this line out if you do not wish to use caching
ADD 71-apt-cacher-ng /etc/apt/apt.conf.d/71-apt-cacher-ng

RUN docker-php-ext-install -j$(nproc) \
  curl \
  gd \
  pgsql \
  tidy \
  xml-parser
  
RUN apt-get -y update && apt-get install unzip

RUN a2enmod rewrite

ADD http://releases.taotesting.com/TAO_3.0.0_build.zip /tmp/TAO_3.0.0_build.zip

WORKDIR /tmp

RUN unzip TAO_3.0.0_build.zip; mv TAO_3.0.0_build web; mv web /home/; chown -R www-data.www-data /home/web

ADD apache.conf /etc/apache2/sites-enabled/000-default.conf
ADD php.ini /etc/php5/apache2/php.ini

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
