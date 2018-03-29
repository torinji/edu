FROM golang:alpine

RUN apk add --update --no-cache bash git sqlite gcc g++ curl && rm -rf /var/cache /etc/apk/cache/*
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
RUN go get -u github.com/kardianos/govendor
RUN go get -u github.com/pilu/fresh
COPY ./app /go/src/app
WORKDIR /go/src/app
RUN govendor fetch github.com/wangzitian0/golang-gin-starter-kit/articles && govendor sync && govendor add +external
ENTRYPOINT ["fresh"]
