#!/bin/bash

PRODUCTION_DIR=/srv/app

cd ${PRODUCTION_DIR}
/usr/local/rbenv/shims/bundle install
/usr/local/rbenv/shims/rake assets:precompile RAILS_ENV=production
