-- Get current stream title (for Apple TV+ etc.).
on run argv
	tell application "TV"
		try
			return current stream title
		on error
			return ""
		end try
	end tell
end run
