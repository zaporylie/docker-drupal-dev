#!/bin/bash

if [ "${DEV_MODULE}" = "XDEBUG" ]; then
  echo "==> Turn on XDebug"
  php5enmod xdebug
  # apparently you cannot disable blackfire standard way.
  sed -ri 's/^extension\s*=\s*blackfire.so/;extension=blackfire.so/g' /etc/php5/mods-available/blackfire.ini
  #php5dismod blackfire
elif [ "${DEV_MODULE}" = "BLACKFIRE" ]; then
  echo "==> Turn on Blackfire"
  php5dismod xdebug
  # Apparently you cannot enable blackfire standard way.
  sed -ri 's/^;extension\s*=\s*blackfire.so/extension=blackfire.so/g' /etc/php5/mods-available/blackfire.ini
  #php5enmod blackfire
else
  echo "==> Turn off dev modules"
  php5dismod xdebug
  sed -ri 's/^extension\s*=\s*blackfire.so/;extension=blackfire.so/g' /etc/php5/mods-available/blackfire.ini
  #php5dismod blackfire
fi
