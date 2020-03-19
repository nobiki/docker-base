FROM debian:buster-slim

ENV JMETER_VER=5.2.1

RUN mkdir -p /usr/share/man/man1 \
 && apt update \
 && apt install -y wget locales tzdata openjdk-11-jdk fonts-noto-cjk \
 && apt clean && apt autoclean \
 && rm -rf /var/lib/apt/lists/*

RUN locale-gen ja_JP.UTF-8 \
 && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
 && update-locale LANG=ja_JP.UTF-8 \
 && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN mkdir -p /usr/local/src/jmeter/ \
 && wget "http://ftp.riken.jp/net/apache/jmeter/binaries/apache-jmeter-${JMETER_VER}.tgz" -O /usr/local/src/jmeter/apache-jmeter-${JMETER_VER}.tgz \
 && tar zxvf /usr/local/src/jmeter/apache-jmeter-${JMETER_VER}.tgz -C /usr/local/lib/ \
 && chown -R 1000 /usr/local/lib/apache-jmeter-${JMETER_VER}/

ENV PATH ${PATH}:/usr/local/lib/apache-jmeter-${JMETER_VER}/bin/
ENV JVM_ARGS "-Duser.language=ja -Dawt.useSystemAAFontSettings=lcd"
