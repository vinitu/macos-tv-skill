-- Resume playback.
on run argv
	tell application "TV" to resume
	return "resumed"
end run
