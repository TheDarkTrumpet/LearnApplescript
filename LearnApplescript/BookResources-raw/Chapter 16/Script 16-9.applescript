 property folder_path : missing value

 tell application "Finder"
	 if folder_path is missing value or not (container folder_path exists) then
		 tell me to set folder_path to (choose folder) as text
	 end if
 end tell

 get folder_path 



