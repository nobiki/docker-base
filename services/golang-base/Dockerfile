FROM golang:1.14rc1-buster as develop
ARG ROOTDIR
ENV ROOTDIR ${ROOTDIR}
WORKDIR /go/src/${ROOTDIR}
ENV XDG_CACHE_HOME /tmp/.cache
RUN go get -u github.com/golang/dep/cmd/dep
