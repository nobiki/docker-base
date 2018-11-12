#!/bin/bash

if [ ! -e /bootstrap.lock ]; then


    touch /bootstrap.lock
fi

# /usr/bin/supervisord -n
tail -f /dev/null
