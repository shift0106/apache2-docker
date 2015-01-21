FROM ubuntu:12.04
MAINTAINER QiuLin Wang <wangql@fuyinshidai.com>
ENV REFRESHED_AT 2015-01-19

RUN apt-get -yqq update
RUN apt-get -yqq install python-setuptools python-software-properties
RUN add-apt-repository ppa:ondrej/php5
RUN apt-get -yqq update

# Install apache and its modules
RUN apt-get -yqq install apache2 libapache2-mod-php5
RUN a2enmod rewrite
RUN a2enmod php5
RUN a2dissite 000-default.conf

# Install php and its modules
RUN apt-get -yqq install php5 php5-apcu php5-gd php5-mysql
RUN apt-get -yqq install php5-redis php5-curl php5-json php5-intl php5-mcrypt php5-imagick imagemagick
RUN php5enmod mcrypt

RUN service apache2 stop

ADD conf/entrypoint.sh /opt/sbin/entrypoint.sh
RUN chmod +x /opt/sbin/entrypoint.sh

VOLUME [ "/data/www", "/opt/sbin/init.d", "/etc/apache2", "/etc/php5", "/var/log/apache2" ]

EXPOSE 80
EXPOSE 443

ENTRYPOINT [ "/opt/sbin/entrypoint.sh" ]
