# Repo Guide

This repo stores a skill for macOS TV.app integration.

## Public interface and internal backend

- `scripts/commands/` is the only public command surface. Run commands from the repo root with paths like `scripts/commands/<entity>/<action>.sh`.
- `scripts/applescripts/` is the internal backend. Do not call AppleScript files directly from skill instructions.
- Only commands listed in `SKILL.md` are public. Other scripts may exist for internal use or legacy cleanup.

## Goal

- Document AppleScript commands for TV.app accurately.
- Prefer runnable examples over long prose.
- Treat media library as real user data.

## Repo Layout

- `AGENTS.md`: this file; rules for coding agents.
- `SKILL.md`: the skill contract and usage instructions for agents.
- `README.md`: public project overview and installation notes.
- `Makefile`: targets `dictionary-tv`, `check`, `compile`, `test` (test-dictionary + test-smoke).
- `scripts/applescripts/playback/state.applescript`, `play.applescript`, `pause.applescript`, `next.applescript`, `previous.applescript`, `seek.applescript`, `back-track.applescript`, `fast-forward.applescript`, `resume.applescript`, `rewind.applescript`.
- `scripts/applescripts/volume/get.applescript`, `set.applescript`; `scripts/applescripts/mute/set.applescript`.
- `scripts/applescripts/track/current.applescript`, `reveal.applescript`, `search.applescript`.
- `scripts/applescripts/playlist/list.applescript`.
- `scripts/applescripts/library/movies.applescript`, `tv-shows.applescript`, `add-files.applescript`.
- `scripts/applescripts/application/current-playlist.applescript`, `current-stream-title.applescript`, `current-stream-URL.applescript`.
- `tests/dictionary_contract.sh`: contract test against TV.app scripting dictionary.
- `tests/smoke_tv.sh`: smoke test for script layer (skips when TV.app not available).
- `.github/workflows/ci-pr.yml`: PR validation, auto-merge, version bump, tag, and release flow.
- `.github/workflows/ci-main.yml`: main-branch validation, patch tag, and release flow.

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
