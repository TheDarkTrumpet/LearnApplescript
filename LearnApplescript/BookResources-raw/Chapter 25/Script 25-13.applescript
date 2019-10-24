set query_text to "INSERT INTO contact_table (first_name, last_name) VALUES ('Dan', 'Smith')"
set the_result to sql_query_insert(query_text)

on sql_query_insert(query_text)
	try
		tell application "MacSQL3"
			tell front document
				set rs to do query query_text results as none
				delete rs
			end tell
		end tell
	on error err_msg number err_num
		try
			delete rs
		end try
		-- Uncomment the next line during testing and debugging
		-- display dialog err_msg & return & query_text
		error err_msg number err_num
	end try
end sql_query_insert


