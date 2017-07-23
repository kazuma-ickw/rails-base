#!/bin/bash

readonly PRODUCTION_DIR=/srv/app
readonly UNICORN_MASTER_ID=`ps aux | grep unicorn_rails\ master | grep -v grep | awk '{ print $2 }'`

if [ -n "$UNICORN_MASTER_ID" ]; then
  kill -9 $UNICORN_MASTER_ID
fi

cd ${PRODUCTION_DIR}
/usr/local/rbenv/shims/bundle exec unicorn_rails -c ${PRODUCTION_DIR}/config/unicorn.rb -D -E production > /tmp/test.log
nginx -s reload
