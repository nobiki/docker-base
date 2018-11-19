#!/bin/bash

if [ -z "`ls /web`" ];then
  hexo --cwd /web init
fi
