# Repo Guide

This repo stores a skill for macOS TV.app integration.

Installed global skill directory: `~/.agents/skills/macos-tv`.
`skills check` and `skills update` may refer to this skill by upstream package name `macos-tv` from `vinitu/macos-tv-skill`.

## Public interface and internal backend

- `scripts/commands/` is the only public command surface. Run commands from the repo root with paths like `scripts/commands/<entity>/<action>.sh`.
- `scripts/applescripts/` is the internal backend. Do not call AppleScript files directly from skill instructions.
- Only commands listed in `SKILL.md` are public. Other scripts may exist for internal use or legacy cleanup.

## Goal

- Document AppleScript commands for TV.app accurately.
- Prefer runnable examples over long prose.
- Treat media library as real user data.

## Source of truth

- `make dictionary-tv` / `make dictionary-standard`
- Live checks with `osascript` against TV.app.
- Raw dictionary commands live only in this file and in the `Makefile`.
- Do not claim support for a feature unless it is in the TV.app scripting dictionary or verified with `osascript`.

## Repo Layout

- `AGENTS.md`: this file; rules for coding agents.
- `SKILL.md`: the skill contract and usage instructions for agents.
- `README.md`: public project overview and installation notes.
- `Makefile`: targets `dictionary-tv`, `check`, `compile`, `test` (test-dictionary + test-smoke).
- `scripts/commands/<entity>/<action>.sh`: public shell wrappers (run from repo root).
- `scripts/commands/_lib/common.sh`: shared shell helpers (`json_ok`, `json_fail`, `run_backend`).
- `scripts/applescripts/<entity>/<action>.applescript`: internal AppleScript backends (`application/`, `library/`, `mute/`, `playback/`, `playlist/`, `track/`, `volume/`).
- `tests/dictionary_contract.sh`: contract test against TV.app scripting dictionary.
- `tests/smoke_tv.sh`: smoke test for the script layer (skips when TV.app not available).
- `.github/workflows/ci-pr.yml`: PR validation, auto-merge, version bump, tag, and release flow.
- `.github/workflows/ci-main.yml`: main-branch validation, patch tag, and release flow.

## Public vs Internal

- Public: `scripts/commands/**` — the only surface skill instructions may call.
- Internal: `scripts/applescripts/**` and `scripts/commands/_lib/common.sh` — backends and helpers, not part of the public contract.
- Output shape and flags are part of the public contract; preserve them unless a breaking change is requested.

## Pitfalls / Env limits

- TV.app automation needs Automation (TCC) permission for the controlling terminal; without it `osascript` calls fail with a permission error.
- Media library access may also need Media Library / Full Disk Access (System Settings → Privacy & Security). Document TCC or app-state blocks clearly.
- TV.app has no media content on a clean macOS install; library read commands may return empty until content is added.
- AirPlay output is not scriptable through this skill; do not claim AirPlay support.

## Safety rules

- Treat the media library as real user data. Never add, delete, or overwrite library content without explicit user approval.
- Write/mutating commands (`library/add-files`) modify real data and require an explicit approval step before running.
- For tests and demos, use the `CodexTest_` prefix for any created artifacts and clean up afterward. Do not leave test data behind.
- Exit codes reflect outcome: `0` success, non-zero failure.

## Validation

After making changes:
- run `make check` to ensure TV.app is available;
- run `make test` to run dictionary contract and smoke tests;
- run `make compile` to compile all AppleScript files and syntax-check shell scripts;
- update `SKILL.md` when command coverage changes.

## Editing Rules

- Keep docs in simple English.
- Do not claim support for a feature unless it is verified with TV.app AppleScript.
- Treat media library as real user data.