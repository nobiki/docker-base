FROM python:3.8.6-alpine as builder

RUN mkdir /myapp
WORKDIR /myapp
COPY myapp/ .

RUN pip install --user -r requirements.txt
ENV PATH=/root/.local/bin:$PATH

COPY bootstrap.sh /
CMD ["/bootstrap.sh"]

