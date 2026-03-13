# macOS TV Skill

A skill for macOS TV.app integration via AppleScript.

## Installation

```bash
npx skills add vinitu/macos-tv-skill
```

Or with [skills.sh](https://skills.sh):

```bash
skills.sh add vinitu/macos-tv-skill
```

## Scope

- Playback controls (play, pause, stop, seek, next/previous)
- Browse library (movies, TV shows, music videos)
- Search by name, genre, artist
- Manage playlists
- AirPlay device selection
- Track metadata reading

## Prerequisites

- macOS with TV.app
- Automation permission for Terminal

## How To Use

From the skill directory (or path where scripts are installed):

```bash
# Start playback (last or selected content)
osascript scripts/playback/play.applescript
# Current track title and metadata
osascript scripts/track/current.applescript
# Search library for "Inception"
osascript scripts/track/search.applescript "Library" "Inception"
```

See `SKILL.md` for the full AppleScript reference and all scripts under `scripts/`.
