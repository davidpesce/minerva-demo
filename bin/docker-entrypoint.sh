#!/usr/bin/env sh

set -eu
set -o pipefail

if [ ! -f "tmp/.db_setup_completed" ]; then
  echo "### Run Setup Minerva Demo ###"
  mkdir -p tmp/
  bin/rails db:setup
  touch tmp/.db_setup_completed
fi

echo "Starting Application..."
bin/bundle exec puma -C config/puma.rb
