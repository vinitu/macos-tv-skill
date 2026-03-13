-- Get current stream URL.
on run argv
	tell application "TV"
		try
			return current stream URL
		on error
			return ""
		end try
	end tell
end run
