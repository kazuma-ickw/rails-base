#!/bin/bash

PRODUCTION_DIR=/srv/app

echo $HOME > /tmp/home

cd ${PRODUCTION_DIR}
/usr/local/rbenv/shims/bundle install
/usr/local/rbenv/shims/rake assets:precompile RAILS_ENV=production
