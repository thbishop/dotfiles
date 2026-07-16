#!/bin/sh
set -eu

[ -n "${HERDR_ACTIVE_PANE_ID:-}" ] || exit 0
[ -n "${HERDR_ACTIVE_WORKSPACE_ID:-}" ] || exit 0

cwd=$(herdr pane get "$HERDR_ACTIVE_PANE_ID" | jq -r '.result.pane.foreground_cwd // empty')
[ -n "$cwd" ] || exit 0

name=$(basename "$cwd")
herdr workspace rename "$HERDR_ACTIVE_WORKSPACE_ID" "$name" >/dev/null
