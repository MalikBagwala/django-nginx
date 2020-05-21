#!/bin/sh

set -e

# Only replace the three variables and keep $host and other variables
envsubst '${APP_HOST},${APP_PORT},${NGINX_PORT}' < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'