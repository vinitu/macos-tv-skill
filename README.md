# macOS TV Skill

A skill for macOS TV.app integration via AppleScript.

## Installation

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

```bash
osascript -e 'tell application "TV" to play'
osascript -e 'tell application "TV" to get name of current track'
osascript -e 'tell application "TV" to search playlist "Library" for "Inception"'
```

See `SKILL.md` for the full command reference.
