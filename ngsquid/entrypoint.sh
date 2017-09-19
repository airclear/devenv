#!/bin/bash
set -e

create_log_dir() {
  mkdir -p ${SQUID_LOG_DIR}
  chmod -R 755 ${SQUID_LOG_DIR}
  chown -R root:root ${SQUID_LOG_DIR}
}

create_cache_dir() {
  mkdir -p ${SQUID_CACHE_DIR}
  chown -R root:root  ${SQUID_CACHE_DIR}
}

apply_backward_compatibility_fixes() {
  if [[ -f /etc/squid3/squid.user.conf ]]; then
    rm -rf /etc/squid3/squid.conf
    ln -sf /etc/squid3/squid.user.conf /etc/squid3/squid.conf
  fi
}

create_log_dir
create_cache_dir
apply_backward_compatibility_fixes

# exec /usr/local/openresty/bin/openresty

# default behaviour is to launch squid
if [[ -z ${1} ]]; then
  if [[ ! -d ${SQUID_CACHE_DIR}/00 ]]; then
    echo "Initializing cache..."
    squid -N -f /etc/squid3/squid.conf -z
  fi
  echo "Starting squid3..."
  exec  squid -f /etc/squid3/squid.conf -NYCd 1
else
  exec "$@"
fi

# squid -f /etc/squid3/squid.conf -NYCd 1

# /usr/local/openresty/bin/openresty -g "daemon off"