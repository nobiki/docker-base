#!/bin/bash

if [ ! -e /bootstrap.lock ]; then

  touch /bootstrap.lock
fi

tail -f /dev/null
