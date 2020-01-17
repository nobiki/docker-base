FROM schemaspy/schemaspy:latest

USER root
RUN apk update \
 && apk add --no-cache curl fontconfig \
 && curl -O https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
 && mkdir -p /usr/share/fonts/NotoSansCJKjp \
 && unzip NotoSansCJKjp-hinted.zip -d /usr/share/fonts/NotoSansCJKjp/ \
 && rm NotoSansCJKjp-hinted.zip \
 && fc-cache -fv

USER java
