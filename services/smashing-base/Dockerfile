FROM ruby:2.7-buster

ENV APP_ROOT /app
RUN mkdir /app
WORKDIR /app

RUN apt-get update \
 && apt-get install -y ruby-dev nodejs \
 && apt-get clean && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/*

# smashing
RUN gem install --no-document smashing

COPY bootstrap.sh /app/bootstrap.sh
CMD ["/app/bootstrap.sh"]

