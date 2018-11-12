FROM golang:1.11.1-stretch

RUN go get -u github.com/golang/dep/cmd/dep

WORKDIR /apps

ENV GOROOT /usr/local/go/
ENV GOPATH /apps/go

ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin


