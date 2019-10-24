try
	display dialog "Do it?"
on error number the_error_number
	display dialog "An error occurred. The number is:" & return & the_error_number
end try


