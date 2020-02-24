FROM golang:1.14rc1-buster as develop
ARG APIDIR
ENV APIDIR ${APIDIR}
ENV GOROOT /usr/local/go/
ENV GOPATH /${APIDIR}/go
WORKDIR /${APIDIR}
RUN go get -u github.com/golang/dep/cmd/dep
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin


FROM golang:1.14rc1-buster as build
ARG APIDIR
ENV APIDIR ${APIDIR}
WORKDIR /${APIDIR}
COPY /${APIDIR} ${APIDIR}/src/
RUN go build -o /${APIDIR}/hello ${APIDIR}/src/hello.go


FROM scratch as release
ARG APIDIR
ENV APIDIR ${APIDIR}
COPY --from=build /${APIDIR}/hello /usr/local/bin/hello
ENTRYPOINT ["/usr/local/bin/hello"]
