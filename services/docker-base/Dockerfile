FROM golang:1.11.1-stretch as develop
WORKDIR /apps
RUN go get -u github.com/golang/dep/cmd/dep
ENV GOROOT /usr/local/go/
ENV GOPATH /apps/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin


FROM golang:1.11.1-stretch as build
WORKDIR /apps
COPY ./apps /apps
RUN go build -o hello hello.go


FROM busybox:1.29.3 as release
WORKDIR /apps
COPY --from=build /apps/hello /usr/local/bin/hello
ENTRYPOINT ["/usr/local/bin/hello"]
