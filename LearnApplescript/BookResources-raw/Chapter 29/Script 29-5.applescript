set file_names to {}
tell application "Finder"
	set the_files to every file of folder "Macintosh HD:Users:hanaan:src:"
	repeat with file_ref in the_files
		set end of file_names to name of file_ref
	end repeat
end tell
return file_names


