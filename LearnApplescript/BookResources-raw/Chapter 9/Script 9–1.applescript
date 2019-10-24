 set today to current date
 if today's weekday is in {Saturday, Sunday} then
	 display dialog "No work today!"
 else if today's weekday is Friday then
	 display dialog "Thank goodness it's Friday!"
 else
	 set days_left to 6 - (today's weekday as integer)
	 display dialog "Only " & days_left & " more days till the weekend!"
 end if


