-- Get current playlist name.
on run argv
	tell application "TV"
		try
			return name of current playlist
		on error
			return ""
		end try
	end tell
end run
