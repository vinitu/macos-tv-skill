# Repo Guide

This repo stores a skill for macOS TV.app integration.

## Goal

- Document AppleScript commands for TV.app accurately.
- Prefer runnable examples over long prose.
- Treat media library as real user data.

## Repo Layout

- `AGENTS.md`: this file; rules for coding agents.
- `SKILL.md`: the skill contract and usage instructions for agents.
- `README.md`: public project overview and installation notes.
- `Makefile`: targets `dictionary-tv`, `check`, `compile`, `test` (test-dictionary + test-smoke).
- `scripts/playback/state.applescript`, `play.applescript`, `pause.applescript`, `next.applescript`, `previous.applescript`, `seek.applescript`, `back-track.applescript`, `fast-forward.applescript`, `resume.applescript`, `rewind.applescript`.
- `scripts/volume/get.applescript`, `set.applescript`; `scripts/mute/set.applescript`.
- `scripts/track/current.applescript`, `reveal.applescript`, `search.applescript`.
- `scripts/playlist/list.applescript`.
- `scripts/library/movies.applescript`, `tv-shows.applescript`, `add-files.applescript`.
- `scripts/application/current-playlist.applescript`, `current-stream-title.applescript`, `current-stream-URL.applescript`.
- `tests/dictionary_contract.sh`: contract test against TV.app scripting dictionary.
- `tests/smoke_tv.sh`: smoke test for script layer (skips when TV.app not available).
- `.github/workflows/ci-pr.yml`, `ci-main.yml`: CI on PR and push to main.

## Validation

After making changes:
- run `make check` to ensure TV.app is available;
- run `make test` to run dictionary contract and smoke tests;
- run `make compile` to compile all AppleScript files (syntax check);
- update `SKILL.md` when command coverage changes.

## Editing Rules

- Keep docs in simple English.
- Do not claim support for a feature unless it is verified with TV.app AppleScript.
- Treat media library as real user data.
