 set new_file to choose file name default location (path to documents folder) default name "job name.indd"

 tell application "Adobe InDesign CS4"
	 set new_doc to make new document
	 save new_doc to new_file
 end tell


