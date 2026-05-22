---
name: macos-tv
description: Apple TV.app integration on macOS for AI agents via AppleScript. Control playback, browse movies and TV shows, manage playlists, and configure AirPlay output.
---

# macOS TV

Use this skill when the task is about Apple TV.app on macOS.

## Main Rule

Use only `scripts/commands`.
Do not call `scripts/applescripts` directly.

## Requirements

- macOS with TV.app
- Automation permissions for the terminal.

## Public Interface

Run commands from `scripts/commands`:

- `scripts/commands/library/*`
- `scripts/commands/playlist/*`
- `scripts/commands/track/*`

## Commands

### Library

```bash
scripts/commands/library/add-files.sh
scripts/commands/library/movies.sh
scripts/commands/library/tv-shows.sh
```

### Playlist

```bash
scripts/commands/playlist/list.sh
```

### Track

```bash
scripts/commands/track/current.sh
scripts/commands/track/reveal.sh
scripts/commands/track/search.sh
```

## Safety Boundaries

- Library changes need approval.
- Internal AppleScript files are not public API.
