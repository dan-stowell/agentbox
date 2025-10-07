FROM ubuntu:24.04

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

COPY agentbox.bazelrc /root/.bazelrc

ENV PATH="/root/.local/bin:${PATH}"
WORKDIR /workspace
