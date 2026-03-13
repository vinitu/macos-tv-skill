-- Set mute. argv: true|false
on run argv
	if (count of argv) < 1 then
		return "Usage: set.applescript <true|false>"
	end if
	set val to (item 1 of argv is "true")

	tell application "TV"
		set mute to val
	end tell
	return "set"
end run
