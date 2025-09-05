FROM alpine:edge AS build

RUN apk add --no-cache --update go gcc g++ make

RUN mkdir /go
ENV GOPATH=/go

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . ./
RUN CGO_ENABLED=1 GOOS=linux make

FROM alpine:edge

WORKDIR /app

COPY --from=build /app/commands/misc/template.html /app/commands/misc/template.html
COPY --from=build /app/bin/* .

EXPOSE 8080/tcp
CMD ["./bot-spot"]
