FROM golang:1.23.2-alpine

RUN apk add --no-cache git curl bash

RUN curl -fLo install.sh https://raw.githubusercontent.com/cosmtrek/air/master/install.sh \
    && chmod +x install.sh && sh install.sh && cp ./bin/air /bin/air

WORKDIR /app

COPY ./app/go.mod ./app/go.sum ./
RUN go mod download

COPY ./app ./

EXPOSE 8080

CMD ["air", "-d", "--build.cmd", "go build -o ./tmp/main ./cmd/api", "--build.bin", "./tmp/main"]
