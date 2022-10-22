FROM golang:1.19-alpine AS multistage
WORKDIR /usr/src/desafio

COPY . .

RUN go mod init testedesafio
RUN go build -o teste

# RUN apk add --no-cache bash
# RUN go run main.go

FROM scratch

WORKDIR /usr/src/desafio

COPY --from=multistage /usr/src/desafio .
CMD ["./teste"]