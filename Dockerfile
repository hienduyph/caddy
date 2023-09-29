ARG VERSION=latest

FROM docker.io/caddy:${VERSION}-builder AS builder

RUN xcaddy --with github.com/caddy-dns/cloudflare --with github.com/mholt/caddy-ratelimit

ARG VERSION=latest
FROM docker.io/caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
