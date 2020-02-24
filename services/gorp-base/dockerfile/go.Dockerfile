FROM golang:1.14rc1-buster as develop
ARG APIDIR
ENV APIDIR ${APIDIR}

WORKDIR /${APIDIR}
RUN go get -u github.com/golang/dep/cmd/dep
ENV GOROOT /usr/local/go/
ENV GOPATH /${APIDIR}/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin


FROM golang:1.14rc1-buster as build
WORKDIR /${APIDIR}
COPY ./${APIDIR} /${APIDIR}
RUN go build -o hello hello.go


FROM scratch as release
WORKDIR /${APIDIR}
COPY --from=build /${APIDIR}/hello /usr/local/bin/hello
ENTRYPOINT ["/usr/local/bin/hello"]
