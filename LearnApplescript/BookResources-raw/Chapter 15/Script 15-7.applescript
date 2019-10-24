try
	try
		try
			tell application "Finder"
				duplicate file source_file_path to folder dest_folder_path
			end tell
		on error number –10006
			display dialog "The file or folder you specify doesn't exist."
		end try
	on error number –15267
		display dialog "The folder already has a file with the same name."
	end try
on error error_message -- Report any other errors
	display dialog "An error has occurred:" & return & error_message
end try


