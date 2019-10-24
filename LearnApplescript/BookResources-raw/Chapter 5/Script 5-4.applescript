tell application "iTunes"
	play
	tell current track
		set the_track_name to name
		set the_album to album
		set the_artist to artist
	end tell
end tell
display dialog "Now listening to " & the_track_name & " of " & the_album & " by " & the_artist & "."


