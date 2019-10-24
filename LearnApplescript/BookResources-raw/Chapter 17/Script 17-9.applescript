 on add_to_log(the_message)
	 set {YYYY, MM, DD} to {year, month, day} of (current date)
	 set MM to MM as integer
	 if MM < 10 then set MM to "0" & MM
	 if DD < 10 then set DD to "0" & DD
	 set log_file_name to (YYYY as text) & "_" & MM & "_" & DD & ".log"
	 set log_file_path to (path to desktop as text) & log_file_name
	 set full_message to return & (current date) & return & the_message
	 set file_ID to open for access file log_file_path with write permission
	 write full_message to file_ID starting at eof
	 close access file_ID
 end add_to_log


