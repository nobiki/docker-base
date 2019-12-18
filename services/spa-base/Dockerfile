FROM nginx:stable as develop
WORKDIR /apps

FROM nginx:stable as release
WORKDIR /apps
COPY default.conf /etc/nginx/conf.d/default.conf
COPY apps/ /apps
