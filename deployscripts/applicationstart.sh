#!/bin/bash

readonly PRODUCTION_DIR=/srv/app
readonly UNICORN_MASTER_ID=`ps aux | grep unicorn_rails\ master | grep -v grep | awk '{ print $2 }'`

if [ -n "$UNICORN_MASTER_ID" ]; then
  kill -9 $UNICORN_MASTER_ID
fi

/usr/local/rbenv/shims/bundle exec unicorn_rails -c ${PRODUCTION_DIR}/config/unicorn.rb -D -E production
nginx -s reload
