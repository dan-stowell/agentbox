FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    curl \
    ca-certificates \
    coreutils \
    grep \
    sed \
    g++ \
    && rm -rf /var/lib/apt/lists/*

COPY setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh && \
    /tmp/setup.sh && \
    rm /tmp/setup.sh

ENV PATH="/root/.local/bin:${PATH}"
WORKDIR /workspace
