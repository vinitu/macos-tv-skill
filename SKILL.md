---
name: macos-tv
description: Apple TV.app integration on macOS for AI agents via AppleScript. Control playback, browse movies and TV shows, manage playlists, and configure AirPlay output.
---

# macOS TV Skill

Control and query Apple TV.app on macOS using AppleScript (`osascript`).

## Playback Controls

```bash
# Play / pause / stop
osascript -e 'tell application "TV" to play'
osascript -e 'tell application "TV" to pause'
osascript -e 'tell application "TV" to playpause'
osascript -e 'tell application "TV" to stop'

# Next / previous track
osascript -e 'tell application "TV" to next track'
osascript -e 'tell application "TV" to previous track'

# Fast forward / rewind / resume
osascript -e 'tell application "TV" to fast forward'
osascript -e 'tell application "TV" to rewind'
osascript -e 'tell application "TV" to resume'

# Seek to position (seconds)
osascript -e 'tell application "TV" to set player position to 120'
osascript -e 'tell application "TV" to get player position'

# Player state: stopped, playing, paused, fast forwarding, rewinding
osascript -e 'tell application "TV" to get player state'
```

## Volume

```bash
osascript -e 'tell application "TV" to set sound volume to 50'
osascript -e 'tell application "TV" to get sound volume'
osascript -e 'tell application "TV" to set mute to true'
osascript -e 'tell application "TV" to set mute to false'
```

## Current Track Info

```bash
osascript -e 'tell application "TV" to get name of current track'

osascript -e 'tell application "TV"
  set t to current track
  return name of t & " | " & artist of t & " | " & (year of t as string) & " | " & time of t
end tell'
```

### Track Properties

| Property | Type | Description |
|----------|------|-------------|
| `name` | string | Track title |
| `artist` | string | Artist name |
| `album` | string | Album name |
| `show` | string | TV show name |
| `season number` | integer | Season number |
| `episode number` | integer | Episode number |
| `episode ID` | string | Episode ID (e.g. "S01E05") |
| `duration` | real | Duration in seconds |
| `time` | string | Duration as readable string |
| `year` | integer | Release year |
| `genre` | string | Genre |
| `description` | string | Description |
| `media kind` | enum | `movie`, `TV show`, `music video` |
| `rating` | integer | User rating (0-100) |
| `unplayed` | boolean | Whether unplayed |
| `played count` | integer | Times played |

## Browsing the Library

```bash
# List all playlists
osascript -e 'tell application "TV" to get name of every playlist'

# List movies
osascript -e 'tell application "TV"
  set output to ""
  repeat with t in (every track of playlist "Movies")
    set output to output & name of t & " (" & year of t & ")" & linefeed
  end repeat
  return output
end tell'

# List TV shows
osascript -e 'tell application "TV"
  set output to ""
  repeat with t in (every track of playlist "TV Shows")
    set output to output & show of t & " S" & (season number of t as string) & "E" & (episode number of t as string) & " - " & name of t & linefeed
  end repeat
  return output
end tell'

# Count items
osascript -e 'tell application "TV" to count of tracks of playlist "Movies"'
```

## Searching

```bash
# Search by name
osascript -e 'tell application "TV" to search playlist "Library" for "Inception"'

# Filter by property
osascript -e 'tell application "TV"
  set results to (every track of playlist "Movies" whose name contains "Matrix")
  set output to ""
  repeat with t in results
    set output to output & name of t & linefeed
  end repeat
  return output
end tell'

# Find unplayed movies
osascript -e 'tell application "TV"
  set results to (every track of playlist "Movies" whose unplayed is true)
  set output to ""
  repeat with t in results
    set output to output & name of t & linefeed
  end repeat
  return output
end tell'
```

## Playing Specific Content

```bash
# Play a movie by name
osascript -e 'tell application "TV"
  play (first track of playlist "Movies" whose name is "Inception")
end tell'

# Play a specific TV episode
osascript -e 'tell application "TV"
  play (first track of playlist "TV Shows" whose show is "Breaking Bad" and season number is 1 and episode number is 1)
end tell'

# Play a playlist
osascript -e 'tell application "TV" to play playlist "My Playlist"'
```

## Playlists

```bash
# Create
osascript -e 'tell application "TV" to make new playlist with properties {name:"My Playlist"}'

# Delete
osascript -e 'tell application "TV" to delete playlist "My Playlist"'

# Add a track
osascript -e 'tell application "TV"
  set t to first track of playlist "Movies" whose name is "Inception"
  duplicate t to playlist "My Playlist"
end tell'
```

## AirPlay

```bash
# List AirPlay devices
osascript -e 'tell application "TV" to get name of every AirPlay device'

# Get current device
osascript -e 'tell application "TV" to get name of current AirPlay device'

# Set AirPlay output
osascript -e 'tell application "TV" to set current AirPlay device to (first AirPlay device whose name is "Living Room")'

# Revert to local
osascript -e 'tell application "TV" to set current AirPlay device to (first AirPlay device whose name is "Computer")'
```

## App Control

```bash
osascript -e 'tell application "TV" to activate'
osascript -e 'tell application "TV" to quit'
osascript -e 'tell application "TV" to set full screen to true'
osascript -e 'tell application "TV" to get version'
```

## Limitations

- Controls local library only — no Apple TV+ streaming, iTunes Store, or unreleased content
- No purchase/rental/download via AppleScript
- No subtitle or audio track control
- No chapter navigation
- Metadata is mostly read-only
- AirPlay may not work with all third-party receivers
- DRM-protected content may have restricted control

## Troubleshooting

| Problem | Fix |
|---------|-----|
| "Can't get playlist" | Verify exact playlist name with `get name of every playlist` |
| "Can't get current track" | Start playback first |
| Script hangs | Limit query scope, avoid fetching all tracks at once |
| "Not authorized" | Grant Automation permission in System Settings |
| AirPlay device not found | Check device is online and name matches exactly |
