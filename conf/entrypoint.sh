#!/bin/sh

if [ -d "/opt/sbin/init.d" ]
then
	for script in `find /opt/sbin/init.d -name "*.sh"`
	do
		. $script
	done
fi

. /etc/apache2/envvars && exec /usr/sbin/apache2 -D FOREGROUND
