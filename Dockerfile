FROM golang:1.20-alpine AS build

WORKDIR /app

COPY main.go .

RUN go build main.go

FROM scratch

COPY --from=build /app/main /main

ENTRYPOINT [ "/main" ]
