-- Search for track in playlist. argv: playlistName query
on run argv
	if (count of argv) < 2 then
		return "Usage: search.applescript <playlist_name> <query>"
	end if
	set plName to item 1 of argv
	set query to item 2 of argv

	tell application "TV"
		set pl to playlist plName
		set found to (every track of pl whose name contains query)
		set output to ""
		repeat with t in found
			set output to output & (name of t) & linefeed
		end repeat
		return output
	end tell
end run
