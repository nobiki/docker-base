#!/bin/sh

PRIVATE=$(curl -s http://169.254.170.2/v2/metadata | jq -r '.Containers[1].Networks[0].IPv4Addresses[0]')
export REMOTE_HOST="http://$PRIVATE:5555"
env

/opt/bin/entry_point.sh
