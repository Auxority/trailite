ARG GO_VERSION=1.22
ARG ALPINE_VERSION=3.19

# Build image
FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} as base

WORKDIR /app

# Development image
FROM base as development

RUN go install github.com/cosmtrek/air@latest

COPY ./app/go.mod ./app/go.sum ./

CMD ["air", "-c", ".air.toml"]


# Build image
FROM base as build

COPY ./app/go.mod ./app/go.sum ./

RUN go mod download

COPY ./app .

RUN go build -o /go/bin/app .


# Production image
FROM alpine:latest as production

WORKDIR /app

COPY --from=build /go/bin/app /go/bin/app

CMD ["/go/bin/app"]
