-- List TV shows in library. argv: [limit] default 50
on run argv
	set limit to 50
	if (count of argv) ≥ 1 then set limit to (item 1 of argv) as integer

	tell application "TV"
		set output to ""
		try
			set lib to first library playlist
			set allTracks to every track of lib
			set n to 0
			repeat with t in allTracks
				if n ≥ limit then exit repeat
				try
					if (kind of t as text) contains "show" then
						set output to output & (name of t) & linefeed
						set n to n + 1
					end if
				end try
			end repeat
		end try
		return output
	end tell
end run
