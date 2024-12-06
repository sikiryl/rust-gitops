FROM rust:alpine3.20 AS build
COPY . .
RUN apk add musl-dev
RUN cargo build --release

FROM alpine:3.20
WORKDIR /app
COPY --from=build target/release/nongkai .
RUN apk add libgcc
EXPOSE 8080
ENTRYPOINT [ "/app/nongkai" ]