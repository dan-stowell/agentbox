#!/usr/bin/env bash
if [ $# -eq 0 ]; then
    echo "Error: No command provided" >&2
    echo "Usage: $0 <command> [args...]" >&2
    exit 1
fi
VERSION=d83c53e
WORKSPACE=$(pwd)
container run \
	--interactive \
	--tty \
	--remove \
	--env "BUILDBUDDY_API_KEY=${BB_API_KEY}" \
	--env "CLAUDE_CONFIG_DIR=/root/.claude" \
	--volume $HOME/.config/agentbox/cache:/root/.cache/ \
	--volume $HOME/.config/agentbox/claude:/root/.claude \
	--volume $HOME/.config/agentbox/codex/:/root/.codex \
	--volume $WORKSPACE:/workspace \
	--volume $HOME/.config/agentbox/output_base/:/workspace/.bazel_output
	"agentbox:${VERSION}" \
	"$@"
