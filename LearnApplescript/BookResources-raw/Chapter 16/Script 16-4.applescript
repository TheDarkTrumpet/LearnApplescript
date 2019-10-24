 repeat
	 display dialog "Enter date:" default answer ""
	 set user_date to text returned of result
	 try
		 set the_date to date user_date
		 if the_date comes after (current date) then
			 exit repeat
		 end if
	 end try
	 display dialog "Re-enter date:" buttons {"OK"} default button 1 with icon caution
 end repeat
 get the_date


