-- Back track (rewind within track).
on run argv
	tell application "TV" to back track
	return "back"
end run
