#!/bin/bash

readonly PRODUCTION_DIR=/srv/app
readonly UNICORN_MASTER_ID=`ps aux | grep unicorn_rails\ master | grep -v grep | awk '{ print $2 }'`

cd ${PRODUCTION_DIR}

if [ -n "$UNICORN_MASTER_ID" ]; then
  kill -s USR2 $UNICORN_MASTER_ID
else
  /usr/local/rbenv/shims/bundle exec unicorn_rails -c ${PRODUCTION_DIR}/config/unicorn.rb -D -E production
fi

readonly NGINX_MASTER_ID=`ps aux | grep nginx:\ master | grep -v grep | awk '{ print $2 }'`
if [ -n "$NGINX_MASTER_ID" ]; then
  nginx -s reload
else
  nginx
fi
