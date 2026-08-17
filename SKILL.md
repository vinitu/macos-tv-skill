---
name: macos-tv
description: Apple TV.app integration on macOS for AI agents via AppleScript. Control playback, browse movies and TV shows, and manage the media library.
---

# macOS TV

Use this skill when the task is about Apple TV.app on macOS.

## Main Rule

Use only `scripts/commands`.
Do not call `scripts/applescripts` directly.

## Requirements

- macOS with TV.app
- Automation permissions for the terminal.
- Media Library / Full Disk Access for library read commands.

## Public Interface

Run commands from `scripts/commands`:

- `scripts/commands/application/*`
- `scripts/commands/library/*`
- `scripts/commands/mute/*`
- `scripts/commands/playback/*`
- `scripts/commands/playlist/*`
- `scripts/commands/track/*`
- `scripts/commands/volume/*`

## Output Rules

- Read commands return the AppleScript backend output (plain text or newline-delimited values); they are not JSON unless noted.
- Wrapper-level errors (missing arguments, missing backend script) return a JSON failure envelope: `{"success": false, "error": "..."}` and exit non-zero.
- `--json`, `--plain`, and `--format=plain|json` are not supported.

## Commands

### Application

```bash
scripts/commands/application/current-playlist.sh
# -> "My Playlist"   (current playlist name, or "" if none)

scripts/commands/application/current-stream-URL.sh
# -> "https://..."   (current stream URL, or "" if none)

scripts/commands/application/current-stream-title.sh
# -> "Show Title"    (current stream title, or "" if none)
```

### Library

`library/add-files.sh` is a **write operation** and modifies real media-library data. Require explicit user approval before running.

```bash
scripts/commands/library/add-files.sh "/Users/me/Movies/CodexTest_movie.m4v"
# -> "added"

scripts/commands/library/movies.sh
# -> "Movie One
#     Movie Two"     (one movie name per line, up to 50)

scripts/commands/library/movies.sh 10
# -> ...             (limit to 10 entries)

scripts/commands/library/tv-shows.sh
# -> "Show A
#     Show B"        (one show name per line, up to 50)
```

### Mute

```bash
scripts/commands/mute/set.sh true
# -> "set"

scripts/commands/mute/set.sh false
# -> "set"
```

### Playback

```bash
scripts/commands/playback/state.sh
# -> "player state: playing
#     current track: Title"

scripts/commands/playback/play.sh
# -> "playing"

scripts/commands/playback/pause.sh
# -> "paused"

scripts/commands/playback/resume.sh
# -> "resumed"

scripts/commands/playback/next.sh
# -> "next"

scripts/commands/playback/previous.sh
# -> "previous"

scripts/commands/playback/back-track.sh
# -> "back"

scripts/commands/playback/fast-forward.sh
# -> "fast forward"

scripts/commands/playback/rewind.sh
# -> "rewind"

scripts/commands/playback/seek.sh 120
# -> "seeked"        (seek to 120 seconds)
```

### Playlist

```bash
scripts/commands/playlist/list.sh
# -> "Up Next
#     Movies"        (one playlist name per line)
```

### Track

```bash
scripts/commands/track/current.sh
# -> "state: playing
#     name: Title
#     artist: ...
#     album: ...
#     duration: 3600
#     show: ...
#     season: 1
#     episode: 2"

scripts/commands/track/reveal.sh "Title"
# -> "revealed"

scripts/commands/track/search.sh "My Playlist" "query"
# -> "Match One
#     Match Two"     (one matching track name per line)
```

### Volume

```bash
scripts/commands/volume/get.sh
# -> "50"

scripts/commands/volume/set.sh 50
# -> "set"
```

## JSON Contract

Track object (documented shape; `track/current.sh` currently returns key/value text, not this JSON):

- `name` (string)
- `artist` (string)
- `album` (string)
- `duration` (number, seconds)

Playlist object:

- `name` (string)

Volume:

- `volume/get.sh` returns the volume as plain text, `0`–`100`.

State:

- `playback/state.sh` returns `player state: <state>` and `current track: <name>` lines.

Success envelope (emitted by the internal `json_ok` helper):

- `{"success": true, "data": ...}`

Failure envelope (emitted by wrappers on missing arguments or missing backend):

- `{"success": false, "error": "..."}`

## Safety Boundaries

- Library changes need approval. `library/add-files.sh` is a write operation; require explicit user approval before running.
- For tests and demos, use the `CodexTest_` prefix for any created artifacts and clean up afterward.
- Internal AppleScript files are not public API.
- AirPlay output is not supported by this skill.