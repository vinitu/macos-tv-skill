-- List playlist names. One per line.
on run argv
	tell application "TV"
		set pls to every playlist
		set output to ""
		repeat with p in pls
			set output to output & (name of p) & linefeed
		end repeat
		return output
	end tell
end run
