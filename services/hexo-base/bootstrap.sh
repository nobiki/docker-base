#!/bin/bash

if [ ! -e /web/package.json ]; then
  tee /web/package.json << 'EOF'
  {
    "dependencies": {
      "hexo": "^3.2.0",
      "hexo-cli": "^1.0.4",
      "hexo-server": "^0.2.0"
    }
  }
EOF

  yarn install
fi

if [ -z "`ls /web/site`" ];then
  mkdir -p /web/site
  cd /web/site && hexo init
fi

cd /web/site && yarn install
cd /web/site && hexo generate
chown -R 1000:1000 /web

cd /web/site && hexo server

