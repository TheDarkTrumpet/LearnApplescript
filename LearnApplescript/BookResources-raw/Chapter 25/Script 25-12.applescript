set query_text to "SELECT first_name, last_name FROM contact_table"
set the_result to sql_query_select(query_text)

on sql_query_select(query_text)
	try
		tell application "MacSQL3"
			tell front document
				set rs to do query query_text results as none with prefetching results
			end tell
			set the_data to values of every row of rs
			delete rs
		end tell
		return the_data
	on error err_msg number err_num
		-- Uncomment the next line during testing and debugging
		-- display dialog err_msg & return & query_text
		try
			delete rs
		end try
		error err_msg number err_num
	end try
end sql_query_select


