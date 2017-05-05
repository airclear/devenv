#!/usr/bin/env bash

cd ../ && docker run -d -p 3306:3306 \
-v $PWD/conf/:/etc/mysql/conf.d \
-v $PWD/data/:/var/lib/mysql/ \
-v $PWD/logs/:/var/log/mysql/ \
-e MYSQL_ROOT_PASSWORD=000000 -d mysql:5.7.18