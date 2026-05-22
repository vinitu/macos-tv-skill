# macOS TV Skill

This repo stores an AI agent skill for Apple TV.app on macOS.

The public interface is `scripts/commands`.
`scripts/applescripts` stores internal AppleScript backends and dictionary-aligned coverage.

## Installation

```bash
npx skills add vinitu/macos-tv-skill
```

Or with [skills.sh](https://skills.sh):

```bash
skills.sh add vinitu/macos-tv-skill
```

## Prerequisites

- macOS with TV.app
- Automation permission granted to your terminal app

## Public Interface

Run skill actions with:

```bash
scripts/commands/<entity>/<action>.sh [args...]
```

## Backend Map

- `scripts/commands/application/*` → AppleScript in `scripts/applescripts/application/*`
- `scripts/commands/library/*` → AppleScript in `scripts/applescripts/library/*`
- `scripts/commands/mute/*` → AppleScript in `scripts/applescripts/mute/*`
- `scripts/commands/playback/*` → AppleScript in `scripts/applescripts/playback/*`
- `scripts/commands/playlist/*` → AppleScript in `scripts/applescripts/playlist/*`
- `scripts/commands/track/*` → AppleScript in `scripts/applescripts/track/*`
- `scripts/commands/volume/*` → AppleScript in `scripts/applescripts/volume/*`

## Command Surface

Application:

- `scripts/commands/application/current-playlist.sh`
- `scripts/commands/application/current-stream-URL.sh`
- `scripts/commands/application/current-stream-title.sh`

Library:

- `scripts/commands/library/add-files.sh`
- `scripts/commands/library/movies.sh`
- `scripts/commands/library/tv-shows.sh`

Mute:

- `scripts/commands/mute/set.sh`

Playback:

- `scripts/commands/playback/back-track.sh`
- `scripts/commands/playback/fast-forward.sh`
- `scripts/commands/playback/next.sh`
- `scripts/commands/playback/pause.sh`
- `scripts/commands/playback/play.sh`
- `scripts/commands/playback/previous.sh`
- `scripts/commands/playback/resume.sh`
- `scripts/commands/playback/rewind.sh`
- `scripts/commands/playback/seek.sh`
- `scripts/commands/playback/state.sh`

Playlist:

- `scripts/commands/playlist/list.sh`

Track:

- `scripts/commands/track/current.sh`
- `scripts/commands/track/reveal.sh`
- `scripts/commands/track/search.sh`

Volume:

- `scripts/commands/volume/get.sh`
- `scripts/commands/volume/set.sh`

## Validation

```bash
make compile
make test
```
