-- Get player state (playing, paused, stopped, etc.) and current track name.
tell application "TV"
	set stateStr to "player state: " & (player state as string)
	set trackName to ""
	try
		set trackName to "current track: " & (name of current track)
	end try
	return stateStr & linefeed & trackName
end tell
