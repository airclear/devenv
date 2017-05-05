@echo off

cd ..

docker run -p 3306:3306 -v %CD%\conf\:/etc/mysql/conf.d -v %CD%\data\:/var/lib/mysql/ -v %CD%\logs\:/var/log/mysql/ -e MYSQL_ROOT_PASSWORD=000000 -d mysql:5.7.18

pause