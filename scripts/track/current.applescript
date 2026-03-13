-- Get current track details: name, artist, album, show, duration, etc.
on run argv
	tell application "TV"
		set output to "state: " & (player state as text) & linefeed
		try
			set t to current track
			set output to output & "name: " & (name of t) & linefeed
			set output to output & "artist: " & (artist of t) & linefeed
			set output to output & "album: " & (album of t) & linefeed
			set output to output & "duration: " & (duration of t) & linefeed
			try
				set output to output & "show: " & (show of t) & linefeed
			end try
			try
				set output to output & "season: " & (season of t) & linefeed
			end try
			try
				set output to output & "episode: " & (episode of t) & linefeed
			end try
		end try
		return output
	end tell
end run
