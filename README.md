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

- `scripts/commands/library/*` → AppleScript in `scripts/applescripts/library/*`
- `scripts/commands/playlist/*` → AppleScript in `scripts/applescripts/playlist/*`
- `scripts/commands/track/*` → AppleScript in `scripts/applescripts/track/*`

## Command Surface

Library:

- `scripts/commands/library/add-files.sh`
- `scripts/commands/library/movies.sh`
- `scripts/commands/library/tv-shows.sh`

Playlist:

- `scripts/commands/playlist/list.sh`

Track:

- `scripts/commands/track/current.sh`
- `scripts/commands/track/reveal.sh`
- `scripts/commands/track/search.sh`

## Validation

```bash
make compile
make test
```
