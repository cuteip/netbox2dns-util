FROM ghcr.io/cuteip/netbox2dns@sha256:48dd26d2d4fbecc07c7ec683d49eb8138a29f4b47512b4d07b70b3ebda318359 AS netbox2dns

FROM debian:12-slim AS runner
RUN apt-get update && \
    apt-get install -yqq git && \
    rm -rf /var/lib/apt/lists/*
COPY --from=netbox2dns /ko-app/netbox2dns /usr/local/bin/netbox2dns
