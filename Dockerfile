ARG VERSION=latest

FROM docker.io/caddy:${VERSION}-builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare

ARG VERSION=latest
FROM docker.io/caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
