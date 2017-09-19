FROM airclear/openresty:latest

MAINTAINER lihang4work@gmail.com

ENV SQUID_VERSION=3.3.8 \
    SQUID_CACHE_DIR=/var/spool/squid3 \
    SQUID_LOG_DIR=/var/log/squid3 \
    SQUID_USER=proxy

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
 && yum -y makecache \
 && yum install -y squid wget \
 && wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py -O - |  python \
 && easy_install supervisor \
 && mkdir -p /etc/supervisor \
 && yum clean all \
 && mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY squid.conf /etc/squid3/squid.conf
COPY entrypoint.sh /sbin/squidentrypoint.sh
RUN chmod 755 /sbin/squidentrypoint.sh

VOLUME ["${SQUID_CACHE_DIR}"]

EXPOSE 3128 80 443
ENTRYPOINT ["supervisord"]

