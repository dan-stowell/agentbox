FROM alpine:3.19

RUN apk add --no-cache \
    bash \
    curl \
    ca-certificates \
    coreutils \
    grep \
    sed \
    libstdc++ \
    libgcc

COPY setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh && \
    /tmp/setup.sh && \
    rm /tmp/setup.sh

ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /workspace
