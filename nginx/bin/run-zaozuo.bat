@echo off

:: zaozuo-web的resources路径
set WEBROOT=E:\apps\test

start python ip-win.py

ping -n 3 127.0.0.1 > nul

set /p ip=<ip

cd ..

docker run -d -p 80:80 -p 443:443 -v %CD%\:/data/nginx/ -v %CD%\conf\nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro -v %CD%\logs:/usr/local/openresty/nginx/logs -v %WEBROOT%:/data/nginx/html/zaozuo/ --add-host "dockerhost:%ip%"  airclear/openresty

pause
