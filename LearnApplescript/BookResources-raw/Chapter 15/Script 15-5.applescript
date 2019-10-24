try
	display dialog "Do it?"
on error number –128
	display dialog "You canceled the script. Bye!"
end try


