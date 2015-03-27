Drupal Docker Image for developers [![Build Status](https://travis-ci.org/zaporylie/docker-drupal-dev.svg?branch=master)](https://travis-ci.org/zaporylie/docker-drupal-dev)
===============================

This image is build on [zaporylie/drupal](http://registry.hub.docker.com/u/zaporylie/drupal/) but adds some usefull tools for developers, like CodeSniffer or xDebug.

## Documentation

You can find documentation on [GitHub](https://github.com/zaporylie/docker-drupal)

## How to use CodeSniffer?

The easiest way is to enter container (with `docker exec -ti <container_id_or_name> /bin/bash`), and:

````
drupalcs /path/to/file/or/module/or/whatever
````

ex.

````
drupalcs /app/drupal/sites/all/modules/contrib/your_module
````
