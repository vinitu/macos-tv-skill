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

- `scripts/commands/application/*`
- `scripts/commands/library/*`
- `scripts/commands/mute/*`
- `scripts/commands/playback/*`
- `scripts/commands/playlist/*`
- `scripts/commands/track/*`
- `scripts/commands/volume/*`

## Commands

### Application

```bash
scripts/commands/application/current-playlist.sh
scripts/commands/application/current-stream-URL.sh
scripts/commands/application/current-stream-title.sh
```

### Library

```bash
scripts/commands/library/add-files.sh
scripts/commands/library/movies.sh
scripts/commands/library/tv-shows.sh
```

### Mute

```bash
scripts/commands/mute/set.sh
```

### Playback

```bash
scripts/commands/playback/back-track.sh
scripts/commands/playback/fast-forward.sh
scripts/commands/playback/next.sh
scripts/commands/playback/pause.sh
scripts/commands/playback/play.sh
scripts/commands/playback/previous.sh
scripts/commands/playback/resume.sh
scripts/commands/playback/rewind.sh
scripts/commands/playback/seek.sh
scripts/commands/playback/state.sh
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

### Volume

```bash
scripts/commands/volume/get.sh
scripts/commands/volume/set.sh
```

## Output Rules

- Commands return JSON by default unless noted otherwise.
- `show.sh` opens the app and returns a small JSON envelope.
- `--json`, `--plain`, and `--format=plain|json` are not supported.

## JSON Contract

Track object:

- `name` (string)
- `artist` (string)
- `album` (string)
- `duration` (number, seconds)

Playlist object:

- `name` (string)

Volume envelope:

- `{"volume": N}` where N is 0–100

State envelope:

- `{"state": "playing"|"paused"|"stopped"}`

Scalar envelopes:

- `success/failure`: `{"success": true/false, "error": "..."}`

## Safety Boundaries

- Library changes need approval.
- Internal AppleScript files are not public API.
