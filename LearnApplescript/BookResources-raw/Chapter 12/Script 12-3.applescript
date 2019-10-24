set remote_app to choose remote application with prompt "Please select the remote iTunes application:"

tell remote_app
	using terms from application "iTunes"
		play
		get current track
	end using terms from
end tell

