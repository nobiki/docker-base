#!/bin/bash

export HOME=/app/dashboard

if [ ! -e $HOME/bootstrap.lock ]; then
  echo "start initial process"

  smashing new dashboard
  cd dashboard && bundle install

  touch $HOME/bootstrap.lock
fi

smashing start -a 0.0.0.0 -p $SMA_PORT
