#!/bin/sh

envsubst "\$PORT" < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
