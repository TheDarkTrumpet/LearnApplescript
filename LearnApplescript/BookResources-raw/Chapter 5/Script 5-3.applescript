tell application "iTunes"
	play
	set the_track_name to name of current track
	set the_album to album of current track
	set the_artist to artist of current track
end tell
display dialog "Now listening to " & the_track_name & " of " & the_album & " by " & the_artist & "."


