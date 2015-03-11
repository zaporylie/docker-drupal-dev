FROM zaporylie/drupal
MAINTAINER Jakub Piasecki <jakub@piaseccy.pl>

# Development tools
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-dev php5-xdebug libpcre3-dev \
 && sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php5/apache2/php.ini \
 && sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php5/cli/php.ini \
 && mkdir -p /app/output \
 && chown www-data:www-data /app/output \
 && echo 'xdebug.remote_enable = 1' >> /etc/php5/mods-available/xdebug.ini \
 && echo 'xdebug.remote_connect_back = 1' >> /etc/php5/mods-available/xdebug.ini \
 && echo 'xdebug.idekey = "vagrant"' >> /etc/php5/mods-available/xdebug.ini \
 && echo 'xdebug.remote_log="/var/log/xdebug/xdebug.log"' >> /etc/php5/mods-available/xdebug.ini \
 && echo 'xdebug.profiler_enable_trigger = 1' >> /etc/php5/mods-available/xdebug.ini \
 && echo 'xdebug.profiler_output_dir="/app/output"' >> /etc/php5/mods-available/xdebug.ini \
 && echo 'xdebug.trace_enable_trigger = 1' >> /etc/php5/mods-available/xdebug.ini \
 && echo 'xdebug.trace_output_dir = "/app/output"' >> /etc/php5/mods-available/xdebug.ini \
 && echo 'xdebug.max_nesting_level = 1000' >> /etc/php5/mods-available/xdebug.ini

VOLUME ["/app/output"]

EXPOSE 80 22 9000

CMD ["/bin/bash", "/root/start.sh"]
