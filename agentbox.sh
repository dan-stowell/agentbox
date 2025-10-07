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
	--volume $HOME/.config/agentbox/cache:/root/.cache/ \
	--volume $HOME/.config/agentbox/claude:/root/.claude \
	--volume $HOME/.config/agentbox/codex/:/root/.codex \
	--volume $WORKSPACE:/workspace \
	"agentbox:${VERSION}" \
	"$@"
