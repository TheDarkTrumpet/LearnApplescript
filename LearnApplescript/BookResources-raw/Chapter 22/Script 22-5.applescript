 set source_folder to choose folder with prompt "Where are the current files?"
 set destination_folder to choose folder with prompt "Where do you want to save the new files?"
 set all_source_files to list files source_folder of extension {"png"} with recursively
 set file_number to 1

 repeat with file_ref in all_source_files
	 -- Get the names of the file and the folder that contains it
	 set file_path to file_ref as text
	 set path_items to splittext file_path using ":"
	 set {folder_name, file_name} to items -2 thru -1 of path_items
	 -- Extract the YYYY-MM-DD style date and reformat it as YYYYMMDD
	 try
		 set date_string to find text "^Screen shot ([0-9]{4})-([0-9]{2})-([0-9]{2})" in file_name using "\\1\\2\\3" with regexp and string result
		 set is_screenshot to true
	 on error -- Not a standard file name for a Mac OS X 10.6 screenshot
		 set is_screenshot to false
	 end try
	 if is_screenshot then
		 -- Assemble the new file name
		 set folder_name to lowercase (change " " into "" in folder_name)
		 set file_number to format file_number into "#####000"
		 set file_name_extension to last item of (splittext file_name using ".")
		 set new_file_name to folder_name & "_screenshot_" & date_string & "_" & file_number & "." & file_name_extension
		 set file_number to file_number + 1
		 -- Duplicate and rename the file
		 tell application "Finder"
			 set new_file to duplicate file_ref to destination_folder
			 set name of new_file to new_file_name
		 end tell
	 end if
 end repeat


