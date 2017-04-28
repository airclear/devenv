#!/usr/bin/env bash

cd ../ && docker run -d -p 8008:80 \
-v $PWD/:/data/nginx/ \
-v $PWD/conf/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro \
-v $PWD/logs:/usr/local/openresty/nginx/logs \
airclear/openresty