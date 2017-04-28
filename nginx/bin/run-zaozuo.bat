@echo off

:: zaozuo-web的resources路径
set WEBROOT=D:\GitWorkspace\zaozuo-web\src\main\resources\

cd ..

docker run -d -p 80:80 -p 443:443 -v %CD%\:/data/nginx/ -v %CD%\conf\nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro -v %CD%\logs:/usr/local/openresty/nginx/logs -v %WEBROOT%:/data/nginx/html/zaozuo/ airclear/openresty

pause