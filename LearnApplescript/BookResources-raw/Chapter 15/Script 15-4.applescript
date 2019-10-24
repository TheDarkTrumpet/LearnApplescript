try
	display dialog "Do it?"
on error the_error_message number the_error_number
	display dialog "An error occurred:" & return & the_error_message & return & the_error_number
end try


