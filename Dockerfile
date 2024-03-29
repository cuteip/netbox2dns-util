FROM ghcr.io/cuteip/netbox2dns@sha256:e427529e28e5ce17c45795f41aaacf6403eaf33566dc1a78f4cb271e23fbf8ea AS netbox2dns

FROM debian:12-slim AS runner
RUN apt-get update && \
    apt-get install -yqq git && \
    rm -rf /var/lib/apt/lists/*
COPY --from=netbox2dns /ko-app/netbox2dns /usr/local/bin/netbox2dns
