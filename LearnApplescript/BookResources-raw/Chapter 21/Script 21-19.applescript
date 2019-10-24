 on run {input, parameters}
	 set file_list to input as list
	 set dialog_reply to display dialog "Enter minimum file size in KB:" default answer "20"
	 set min_size_in_kb to text returned of dialog_reply as number
	 set filtered_files to {}
	 tell application "Finder"
		 repeat with file_ref in file_list
			 if (size of file_ref) > (min_size_in_kb * 1024) then
				 set end of filtered_files to contents of file_ref
			 end if
		 end repeat
	 end tell
	 return filtered_files
 end run


