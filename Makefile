.PHONY: dictionary-tv compile check test test-dictionary test-smoke

dictionary-tv:
	@sdef /System/Applications/TV.app

compile:
	@set -euo pipefail; \
	find scripts -name '*.applescript' -print | while IFS= read -r file; do \
		osacompile -o /tmp/$$(echo "$$file" | tr '/' '_' | sed 's/\.applescript$$/.scpt/') "$$file"; \
	done

check:
	@osascript -e 'tell application "TV" to get name' >/dev/null || { echo "check: TV.app not available"; exit 1; }
	@echo "TV.app is available"

test: test-dictionary test-smoke

test-dictionary:
	@bash tests/dictionary_contract.sh

test-smoke:
	@bash tests/smoke_tv.sh
