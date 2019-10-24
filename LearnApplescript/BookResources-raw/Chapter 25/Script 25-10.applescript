 set query_text to "SELECT first_name, last_name FROM contact_table"
 tell application "MacSQL3"
	 tell front document
		 set the_result_set to do query query_text results as none with prefetching results 
	 end tell
	 set the_data to values of every row of the_result_set
	 delete the_result_set
 end tell
 return the_data


