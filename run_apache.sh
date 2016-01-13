#!/bin/bash

#create directories if necessary
if ! [ -d /tmp/run/httpd ]; then mkdir -p /tmp/run/httpd;fi
if ! [ -d /tmp/log/httpd ]; then mkdir -p /tmp/log/httpd;fi
if ! [ -d /tmp/lock/httpd ]; then mkdir -p /tmp/lock/httpd;fi

#run Apache
httpd -D FOREGROUND
