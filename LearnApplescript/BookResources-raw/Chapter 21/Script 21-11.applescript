 set current_mailbox_name to "AppleScript Lists"
 set archive_mailbox_name to "AppleScript Archive"

 set start_date to calculate_start_of_month(current date)
 tell application "Mail"
	 tell mailbox current_mailbox_name
		 repeat while (count every message) > 0
			 tell (every message whose date received ≥ start_date)
				 if (count) > 0 then
					 set archive_mailbox to my make_sub_mailbox_for_month(archive_mailbox_name, start_date)
					 set its mailbox to archive_mailbox
				 end if
			 end tell
			 delay 2
			 set start_date to my calculate_start_of_previous_month(start_date)
		 end repeat
	 end tell
 end tell


