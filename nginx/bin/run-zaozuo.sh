#!/usr/bin/env bash

# zaozuo-web的resources路径
WEBROOT=/Users/airclear/works/projects/zaozuo/zaozuo-web/src/main/resources

# linux获取ip
# ifconfig|grep 'inet '|grep -v '127.0'|xargs|awk -F '[ :]' '{print $2}'

cd ../ && docker run -d -p 80:80 -p 443:443 \
-v $PWD/:/data/nginx/ \
-v $PWD/conf/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro \
-v $PWD/logs:/usr/local/openresty/nginx/logs \
-v $WEBROOT:/data/nginx/html/zaozuo/ \
airclear/openresty