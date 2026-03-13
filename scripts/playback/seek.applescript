-- Seek to position. argv: seconds
on run argv
	if (count of argv) < 1 then
		return "Usage: seek.applescript <seconds>"
	end if
	set secs to (item 1 of argv) as real

	tell application "TV"
		set player position to secs
	end tell
	return "seeked"
end run
