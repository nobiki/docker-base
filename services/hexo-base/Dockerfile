FROM node:10.13-alpine as development
WORKDIR /web
ENV PATH $PATH:/web/node_modules/.bin/
ENV CGO_ENABLED 0
ENTRYPOINT ["sh","/bootstrap.sh"]


FROM nginx:stable-alpine as release
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY web /web
