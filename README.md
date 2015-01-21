# apache2-docker
Apache2 web server docker image with php5, based on ubuntu:12.04

# Overview

Apache2 web server docker image with php5, based on ubuntu:12.04

This image is based on ubuntu:12.04.

Apache and PHP5 is installed. PHP5 is used a ppa - ondrej/php5, you can find this ppa on: https://launchpad.net/~ondrej/+archive/ubuntu/php5 .

Avaliable php5 modules are php5-apcu, php5-gd, php5-mysql, php5-redis, php5-curl, php5-json, php5-intl, php5-mcrypt, php5-imagick(imagemagick is also added).

Apache listen on port 80 and 443.
Web application is placed in /data/www.

# Usage

You can add your own apache/php configuration files in a custom directory, then mount them to the docker container. You can also add your own init scripts and view apache logs like this:

docker run -d -v /srv/docker-example/www:/data/www -v /srv/docker-example/init.d:/opt/sbin/init.d -v /srv/docker-example/conf/apache2:/etc/apache2 -v /srv/docker-example/conf/php5:/etc/php5 -P –name=“your-apache-docker-container-name” qiulinwang/apache

note:
I suppose you placed your apache/php configuration files in /srv/docker-example/conf/apache2 and /srv/docker-example/conf/php5, placed your init scripts in /srv/docker-example/init.d(only shell scripts can be executed), and your application sources in /srv/docker-example/www.
