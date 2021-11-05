FROM golang:1.16.5 as builder

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOARCH=amd64

WORKDIR /my-app

COPY go.mod .

COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o my-app ./cmd/my-app/main.go

FROM alpine:3.14 as production

RUN apk add --no-cache ca-certificates

COPY --from=builder my-app .

EXPOSE 8080

CMD ./my-app