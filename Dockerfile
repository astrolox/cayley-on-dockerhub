FROM golang

MAINTAINER Astrolox <astrolox@gmail.com>

RUN go get -v github.com/tools/godep
RUN go get -v github.com/google/cayley

WORKDIR /go/src/github.com/google/cayley

RUN godep restore

RUN go install -v github.com/google/cayley/cmd/cayley

RUN mkdir -p /data
VOLUME ["/data"]

EXPOSE 64321

CMD ["cayley", "http", "-config", "/data/cayley.cfg", "-init"]
