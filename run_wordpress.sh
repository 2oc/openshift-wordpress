#!/bin/bash

#create directories if necessary
if ! [ -d /tmp/run/httpd ]; then mkdir -p /tmp/run/httpd;fi
if ! [ -d /tmp/log/httpd ]; then mkdir -p /tmp/log/httpd;fi
if ! [ -d /tmp/lock/httpd ]; then mkdir -p /tmp/lock/httpd;fi

# install wordpress if not in persistentvolume
if [ ! -f /var/www/html/index.php ]; then
  cp -vfpr /wordpress/* /var/www/html/
fi

#run Apache
httpd -f /httpd.conf -D FOREGROUND
