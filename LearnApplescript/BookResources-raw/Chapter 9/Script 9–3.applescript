 set dialog_reply to display dialog "Enter your date of birth" default answer "" buttons {"weeks", "days"}
 set birthday_string to text returned of dialog_reply
 set increment_chosen to button returned of dialog_reply
 try
	 set birthday to date birthday_string
 on error
	 display dialog "Bad date format!"
	 return
 end try
 set age_in_seconds to (current date) - birthday
 if increment_chosen = "weeks" then
	 set age_in_weeks to age_in_seconds div weeks
	 display dialog "You have been alive " & age_in_weeks & " weeks"
 else
	 set age_in_days to age_in_seconds div days
	 display dialog "You have been alive " & age_in_days & " days"
 end if


