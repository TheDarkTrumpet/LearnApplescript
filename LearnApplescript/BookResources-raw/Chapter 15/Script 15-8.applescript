property is_logging_enabled : true -- Set to false to disable error logging

on log_warning(warning_message)
	if is_logging_enabled then
		-- Write warning message to file...
	end if
end log_warning

on log_error(error_message, error_number)
	if is_logging_enabled then
		-- Write error message to file...
	end if
end log_error

-- Rest of script goes here...


