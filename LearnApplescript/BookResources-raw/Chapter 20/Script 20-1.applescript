 set the_folder to (choose folder)
 clean_alias_files_in_folder(the_folder)

 on clean_alias_files_in_folder(the_folder)
	 tell application "Finder"
		 -- Check each of the alias files in this disk/folder
		 set alias_files to every alias file of the_folder
		 repeat with file_ref in alias_files
			 if not (exists original item of file_ref) then
				 delete file_ref
			 end if
		 end repeat
		 -- Clean the alias files in each sub-folder
		 set sub_folders to every folder of the_folder
		 repeat with folder_ref in sub_folders
			 my clean_alias_files_in_folder(folder_ref)
		 end repeat
	 end tell
 end clean_alias_files_in_folder


