#!/bin/sh

if [ -z "$SQUID_USER" ];then
  echo "Variable SQUID_USER not set! Exiting."
  exit 1
fi

if [ -z "$SQUID_PASSWORD" ];then
  echo "Variable SQUID_SQUID_PASSWORD not set! Exiting."
  exit 1
fi

echo " - Creating the squid user '${SQUID_USER}':"
htpasswd -bc "/etc/squid/passwords" ${SQUID_USER} ${SQUID_PASSWORD}

echo " - Starting squid:"
/usr/sbin/squid -NYCd 1
