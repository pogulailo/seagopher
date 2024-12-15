FROM golang:1.23.2-alpine AS builder

RUN apk add --no-cache git curl bash

WORKDIR /app

COPY ./app/go.mod ./app/go.sum ./
RUN go mod download

COPY ./app ./

RUN go build -o /main ./cmd/api

FROM alpine:3.18

RUN apk add --no-cache ca-certificates

WORKDIR /app

COPY --from=builder /main /app/main

EXPOSE 8080

CMD ["./main"]
