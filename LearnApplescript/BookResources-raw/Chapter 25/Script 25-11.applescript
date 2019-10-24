tell application "MacSQL3"
	tell front document
		set result_set to do query "select * from some_table" results as none
	end tell
	set result_text to ""
	set row_num to 1
	try
		repeat
			set the_values to tab delimited values of row row_num of result_set
			set result_text to result_text & the_values & linefeed
			set rowNum to rowNum + 1
		end repeat
	on error err
	end try
	delete result_set
end tell
return result_text


