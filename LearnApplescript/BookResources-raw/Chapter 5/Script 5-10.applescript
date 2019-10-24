tell application "Finder"
	every file of entire contents of folder "Documents" of home whose size > (10 * 1000 * 1000)
end tell


