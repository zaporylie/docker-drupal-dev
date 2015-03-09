FROM zaporylie/drupal
MAINTAINER Jakub Piasecki <jakub@piaseccy.pl>

RUN apt-get update

# Development tools
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-dev php5-xdebug libpcre3-dev
ADD ./conf/xdebug.ini /etc/php5/mods-available/xdebug.ini

EXPOSE 80 22 9000

CMD ["/usr/bin/supervisord"]
