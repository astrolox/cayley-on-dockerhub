FROM golang

MAINTAINER Astrolox <astrolox@gmail.com>

RUN go get github.com/google/cayley
RUN echo "graph.Vertex().All()" | cayley repl --dbpath=/src/github.com/google/cayley/testdata.nt
