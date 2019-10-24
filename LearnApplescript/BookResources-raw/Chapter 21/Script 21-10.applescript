 using terms from application "Mail"
	 on perform mail action with messages message_list
		 repeat with message_ref in message_list
			 set {the_date, the_text} to {date received, content} of message_ref
			 set the_file to POSIX file (POSIX path of (path to documents folder) & "Automation Logs/" & format_date_stamp(the_date) & ".txt")
			 write_UTF16_file(the_file, the_text)
		 end repeat
	 end perform mail action with messages
 end using terms from

 on format_date_stamp(the_date)
	 set date_stamp to year of the_date as text
	 repeat with number_ref in {month, day, hours, minutes, seconds} of the_date
		 set date_stamp to date_stamp & "-" & pad_with_zero(number_ref as integer)
	 end repeat
	 return date_stamp
 end format_date_stamp


