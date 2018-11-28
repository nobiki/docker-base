#!/bin/bash

if [ ! -e /web/package.json ]; then
  tee /web/package.json << 'EOF'
  {
    "dependencies": {
      "hexo": "^3.2.0",
      "hexo-cli": "^1.0.4",
      "hexo-generator-archive": "^0.1.4",
      "hexo-generator-category": "^0.1.3",
      "hexo-generator-feed": "^1.2.2",
      "hexo-generator-robotstxt": "^0.2.0",
      "hexo-generator-seo-friendly-sitemap": "0.0.21",
      "hexo-generator-index": "^0.2.0",
      "hexo-generator-tag": "^0.2.0",
      "hexo-renderer-ejs": "^0.3.0",
      "hexo-renderer-less": "^0.2.0",
      "hexo-renderer-marked": "^0.3.0",
      "hexo-renderer-stylus": "^0.3.1",
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

cd /web/site && hexo generate
chown -R 1000:1000 /web

cd /web/site && hexo server

