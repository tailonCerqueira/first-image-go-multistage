FROM golang:1.19-alpine AS multistage
WORKDIR /

COPY main.go ./

RUN apk add --no-cache bash
RUN go run main.go

FROM scratch

COPY --from=multistage / .
CMD ["./main"]