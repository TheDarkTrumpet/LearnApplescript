 set the_folder to choose folder
 set mb_limit to 10
 set byte_limit to mb_limit * 1024 * 1024
 set list_of_large_files to get_large_files(the_folder, byte_limit)

 on get_large_files(the_folder, minimum_size_in_bytes)
	 tell application "Finder"
		 --Find all the matching files in this folder
		 set found_files_list to every file of the_folder whose size ≥ minimum_size_in_bytes and class is not application file
		 --Process each sub-folder in turn
		 set sub_folders_list to every folder of the_folder
		 repeat with sub_folder_ref in sub_folders_list
			 set found_files_list to found_files_list & my get_large_files(sub_folder_ref, minimum_size_in_bytes)
		 end repeat
	 end tell
	 return found_files_list
 end get_large_files


