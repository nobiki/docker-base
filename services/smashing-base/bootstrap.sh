#!/bin/bash

if [ ! -e ./bootstrap.lock ]; then

  smashing new dashboard
  cd dashboard && bundle install

  touch ./bootstrap.lock
fi

smashing start -a 0.0.0.0 -p $SMA_PORT
