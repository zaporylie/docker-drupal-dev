Drupal Docker Image for developers
===============================

This image is build on [zaporylie/drupal](http://registry.hub.docker.com/u/zaporylie/drupal/) but adds some useful tools for developers, like CodeSniffer or xDebug.

## Documentation

If you are looking for documentation, go to [zaporylie/docker-drupal](https://github.com/zaporylie/docker-drupal)
Addtional info, dev specific, you can find here.

## Additional configuration

| ENNVIRONMENTAL VARIABLE  |  DEFAULT VALUE |  COMMENTS  |
|:-:|:-:|:-:|
| DRUPAL_TEST_CS (not implemented) | 0 |  |
| DRUPAL_TEST_CS_PATH (not implemented) | /app/drupal |  |
| DEV_MODULE | XDEBUG | Supported: XDEBUG, BLACKFIRE |

## Profiling with blackfire or using xdebug

You will get xdebug by default, but if you prefer to use Blackfire for profiling instead use DEV_MODULE env variable with value BLACKFIRE instead.
But remember to run [blackfire/blackfire](https://registry.hub.docker.com/u/blackfire/blackfire/) container before and link it to this container like that:

````
docker run -dP --link blackfire:blackfire -e BLACKFIRE_SERVER_ID=put-blackfire-server-id-here -e BLACKFIRE_SERVER_TOKEN=put-blackfire-server-token-here -e DEV_MODULE=BLACKFIRE zaporylie/drupal-dev
````

## What about CodeSniffer?

The easiest way is to enter container (with `docker exec -ti <container_id_or_name> /bin/bash`), and:

````
drupalcs /path/to/file/or/module/or/whatever
````

Available methods:
* drupalcs - standard checking against Drupal coding standards
* drupalcs-bp - checking against Drupal best practices
* drupalcs-fix - automated way to fix issues with coding standards
