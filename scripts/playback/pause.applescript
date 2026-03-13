-- Pause playback.
on run argv
	tell application "TV" to pause
	return "paused"
end run
