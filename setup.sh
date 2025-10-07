#!/usr/bin/env bash
set -ex

mkdir -p \
	/root/.local/bin \
	/claude \
	/codex \
	/workspace

chown -R 1000:1000 \
	/root/.local/bin \
	/claude \
	/codex \
	/workspace

curl -fsSL https://claude.ai/install.sh | bash -s 2.0.9

curl -fsSL -o bazelisk \
	https://github.com/bazelbuild/bazelisk/releases/download/v1.27.0/bazelisk-linux-arm64

mv bazelisk /root/.local/bin

curl -fsSL -o codex-aarch64-unknown-linux-musl.tar.gz \
	https://github.com/openai/codex/releases/download/rust-v0.45.0/codex-aarch64-unknown-linux-musl.tar.gz

tar zxf codex-aarch64-unknown-linux-musl.tar.gz
mv codex-aarch64-unknown-linux-musl /root/.local/bin/codex
rm codex-aarch64-unknown-linux-musl.tar.gz
