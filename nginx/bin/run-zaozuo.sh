#!/usr/bin/env bash

# zaozuo-web的resources路径
WEBROOT=/Users/airclear/works/projects/zaozuo/zaozuo-web/src/main/resources

# linux获取ip
# ifconfig|grep 'inet '|grep -v '127.0'|xargs|awk -F '[ :]' '{print $2}'

localip=`ifconfig|grep 'inet '|grep -v '127.0'|xargs|awk -F '[ :]' '{print $2}'`

# 获取当前脚本路径
SOURCE="$0"
while [ -h "$SOURCE"  ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"

rm -f ${DIR}/../conf/conf.d/zaozuo.conf
cp ${DIR}/../conf/conf.d/zaozuo.conf.tmpl ${DIR}/../conf/conf.d/zaozuo.conf
sed -i '' "s/hostip/${localip}/g" ${DIR}/../conf/conf.d/zaozuo.conf
sed -i '' "s/dockerhost/${localip}/g" ${DIR}/../conf/conf.d/zaozuo.conf


docker run -d -p 80:80 -p 443:443 \
-v $DIR/../:/data/nginx/ \
-v $DIR/../conf/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro \
-v $DIR/../logs:/usr/local/openresty/nginx/logs \
-v $WEBROOT:/data/nginx/html/zaozuo/ \
airclear/openresty
