 tell application "Finder"
	 set documents_folder to folder "Documents" of home
	 set backup_folder to folder "Backup Files" of disk "Backup Server"
	 set file_name to "Accounts Database.fp7"
	 -- Get modification date of the original file
	 set original_file to file file_name of documents_folder
	 set original_modification_date to modification date of original_file
	 -- Get modification date of the backup file
	 set backup_file to file file_name of backup_folder
	 set backup_modification_date to modification date of backup_file
	 if original_modification_date > backup_modification_date then
		 duplicate original_file to backup_folder with replacing
	 end if
 end tell


