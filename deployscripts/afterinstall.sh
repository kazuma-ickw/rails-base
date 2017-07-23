#!/bin/bash

readonly PRODUCTION_DIR=/srv/app

env > /tmp/home

cd ${PRODUCTION_DIR}
/usr/local/rbenv/shims/bundle install --path=vendor/bundle
/usr/local/rbenv/shims/rake assets:precompile RAILS_ENV=production
