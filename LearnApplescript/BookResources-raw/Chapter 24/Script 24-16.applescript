 tell application "Microsoft Entourage"
	 set selected_contacts to my get_selection_as_class(contact)
	 if selected_contacts is missing value then
		 beep 2
		 return
	 end if
	 repeat with this_contact in (selected_contacts)
		 set birthday_text to birthday of this_contact
		 set the_birthday to AppleScript's date birthday_text
		 set month_day to day of the_birthday
		 set month_number to month of the_birthday as integer
		 set recurrence_string to "FREQ=YEARLY;INTERVAL=1;BYMONTHDAY=" & month_day & ";BYMONTH=" & month_number & ";WKST=SU"
		 set the_name to first name of this_contact & " " & last name of this_contact
		 set event_label to "Birthday - " & the_name
		 make new event with properties {subject:event_label, start time:the_birthday, all day event:true, recurring:true, recurrence:recurrence_string}
	 end repeat
 end tell

 on get_selection_as_class(required_type)
	 tell application "Microsoft Entourage"
		 try
			 set the_selection to selection
			 set the_class to class of the_selection
			 if the_class is list then 
				 set the_class to class of item 1 of the_selection
			 end if
			 if the_class is not required_type then error
		 on error
			 return missing value
		 end try
		 return the_selection
	 end tell
 end get_selection_as_class


