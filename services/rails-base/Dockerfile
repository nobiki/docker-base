FROM ruby:2.5.3-alpine

RUN apk add --no-cache --update\
    build-base \
    bash \
    sudo \
    git \
    curl \
    openssh \
    tzdata \
    nodejs \
    yarn \
    mariadb-dev \
    sqlite-dev \
    linux-headers

# useradd
RUN adduser -u 1000 -g 1000 -S rails \
    && echo "rails ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo 'rails:rails' | chpasswd

# Install rails
RUN gem install rails -v "5.2.2"

RUN mkdir /web
WORKDIR /web
