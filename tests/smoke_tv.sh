#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! osascript -e 'tell application "TV" to get name' >/dev/null 2>&1; then
	echo "smoke_tv: TV.app not available; skipping." >&2
	exit 0
fi

state_out="$(osascript "$ROOT_DIR/scripts/applescripts/playback/state.applescript" 2>&1)" \
	|| { echo "smoke_tv: playback/state failed: $state_out" >&2; exit 1; }
printf '%s\n' "$state_out" >/dev/null

track_out="$(osascript "$ROOT_DIR/scripts/applescripts/track/current.applescript" 2>&1)" \
	|| { echo "smoke_tv: track/current failed: $track_out" >&2; exit 1; }
playlist_out="$(osascript "$ROOT_DIR/scripts/applescripts/playlist/list.applescript" 2>&1)" \
	|| { echo "smoke_tv: playlist/list failed: $playlist_out" >&2; exit 1; }
printf '%s\n' "$track_out" "$playlist_out" >/dev/null

echo "smoke_tv: ok"