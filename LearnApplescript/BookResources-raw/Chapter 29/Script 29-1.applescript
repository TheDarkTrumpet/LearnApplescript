 set temp_folder to do shell script "mktemp -dt CTFD"
 do shell script "opendiff " & quoted form of export_document(1, temp_folder) & space & quoted form of export_document(2, temp_folder) & " &>/dev/null &"

 to export_document(doc_index, to_folder)
	 tell application "AppleScript Editor"
		 set {the_name, the_code} to {name, text} of document doc_index
	 end tell
	 set file_path to to_folder & "/" & the_name & ".applescript"
	 set temp_list to paragraphs of the_code
	 set AppleScript's text item delimiters to linefeed
	 set the_code to the_code as text
	 write_UTF8_file(POSIX file file_path, the_code)
	 return file_path
 end export_document

 to write_UTF8_file(the_file, the_text)
	 set file_ID to open for access the_file with write permission
	 set eof file_ID to 0
	 write «data rdatEFBBBF» to file_ID
	 write the_text to file_ID as «class utf8»
	 close access file_ID
 end write_UTF8_file


