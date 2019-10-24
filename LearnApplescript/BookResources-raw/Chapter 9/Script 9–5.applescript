 set time_difference to (time to GMT) / hours
 if time_difference mod 1 = 0 then
	 set time_difference to time_difference as integer
 end if
 if time_difference < 0 then
	 set time_difference to -time_difference
	 set the_message to "You are " & time_difference & " hours behind GMT"
 else if time_difference > 0 then
	 set the_message to "You are " & time_difference & " hours ahead of GMT"
 else
	 set the_message to "Your time zone is GMT"
 end if
 display dialog the_message


