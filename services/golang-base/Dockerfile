FROM golang:1.13.7-buster as develop
WORKDIR /apps
RUN go get -u github.com/golang/dep/cmd/dep
ENV GOROOT /usr/local/go/
ENV GOPATH /apps/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
VOLUME ${PWD}/apps:/apps


FROM golang:1.13.7-buster as build
WORKDIR /apps
COPY ./apps /apps
RUN go build -o hello hello.go


FROM scratch as release
WORKDIR /apps
COPY --from=build /apps/hello /usr/local/bin/hello
ENTRYPOINT ["/usr/local/bin/hello"]
