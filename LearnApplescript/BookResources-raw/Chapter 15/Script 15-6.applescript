try
	tell application "Finder"
		duplicate file source_file_path to folder dest_folder_path
	end tell
on error error_message number error_number
	if error_number is –10006 then
		display dialog "The file or folder you specify doesn't exist."
	else if error_number is –15267 then
		display dialog "The folder already has a file with the same name."
	else -- Report any other errors
		display dialog "An error has occurred:" & return & error_message
	end if
end try


