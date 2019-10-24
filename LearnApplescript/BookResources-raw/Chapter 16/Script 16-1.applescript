try
	display dialog "Hello World!"
on error error_text number error_number
	display dialog "An error occurred." & return & "Message: " & error_text & return & "Number: " & error_number
end try


