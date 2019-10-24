tell application "iTunes"
	set everything_yellow_playlist to make new user playlist with properties {name:"Everything Yellow"}
	duplicate (every track of library playlist 1 whose name contains "yellow") to everything_yellow_playlist
end tell


