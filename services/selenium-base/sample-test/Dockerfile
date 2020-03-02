FROM python:3

RUN  apt update \
 &&  apt install -y libnss3 \
 &&  apt clean &&  apt autoclean \
 &&  rm -rf /var/lib/apt/lists/*

RUN wget "https://chromedriver.storage.googleapis.com/77.0.3865.40/chromedriver_linux64.zip" -O /usr/local/bin/chromedriver_linux64.zip && \
    cd /usr/local/bin/ && unzip chromedriver_linux64.zip

RUN wget "https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz" -O /usr/local/bin/geckodriver-v0.24.0-linux64.tar.gz && \
    cd /usr/local/bin/ && tar zxvf geckodriver-v0.24.0-linux64.tar.gz

COPY testcase/ /testcase/
WORKDIR /testcase
RUN pip install selenium==3.13.0

COPY bootstrap.sh /bootstrap.sh
CMD /bootstrap.sh
