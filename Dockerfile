FROM golang:1.13.8-alpine3.11 as build
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /desafio-docker-go

FROM scratch
COPY --from=build /desafio-docker-go /desafio-docker-go

ENTRYPOINT ["/desafio-docker-go"] 
