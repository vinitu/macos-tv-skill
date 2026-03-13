-- Get volume (0-100).
on run argv
	tell application "TV"
		return (sound volume) as text
	end tell
end run
