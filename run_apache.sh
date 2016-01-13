#!/bin/bash

#set variables
APACHE_LOG_DIR="/tmp/log/httpd"
APACHE_LOCK_DIR="/tmp/lock/httpd"
APACHE_PID_FILE="/tmp/run/httpd/httpd.pid"
APACHE_RUN_DIR="/tmp/run/httpd"

#create directories if necessary
if ! [ -d /tmp/run/httpd ]; then mkdir -p /tmp/run/httpd;fi
if ! [ -d /tmp/log/httpd ]; then mkdir -p /tmp/log/httpd;fi
if ! [ -d /tmp/lock/httpd ]; then mkdir -p /tmp/lock/httpd;fi

#run Apache
httpd -D FOREGROUND
