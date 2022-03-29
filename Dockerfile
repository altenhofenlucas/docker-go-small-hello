FROM golang:1.18 AS builder
WORKDIR /go/src/docker-go-small-hello
COPY app.go ./
RUN go mod init app && go build .

FROM scratch
WORKDIR /root/
COPY --from=builder /go/src/docker-go-small-hello/app ./
CMD ["./app"]
