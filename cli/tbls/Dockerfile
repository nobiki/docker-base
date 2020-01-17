FROM k1low/tbls:latest

SHELL ["sh","-c"]

RUN apk update \
 && apk add bash curl \
 && apk add --no-cache curl graphviz fontconfig \
 && curl -O https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
 && mkdir -p /usr/share/fonts/NotoSansCJKjp \
 && unzip NotoSansCJKjp-hinted.zip -d /usr/share/fonts/NotoSansCJKjp/ \
 && rm NotoSansCJKjp-hinted.zip \
 && fc-cache -fv \
 && apk del bash curl

RUN chown 1000 /work
USER 1000

SHELL ["/bin/bash", "-c"]
