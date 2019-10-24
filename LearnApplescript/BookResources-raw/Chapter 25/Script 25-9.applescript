tell application "FileMaker Pro"
	tell database "Company Calendar"
		show every record of table "Meetings"
		tell window 1
			tell layout "Meeting Details"
				go to it
				if requests exists then delete requests
				set my_request to create request
				tell my_request
					set cell "Date" to "=Wednesday"
					set cell "Start Time" to "8 AM...12 PM"
					set cell "Attendees::First Name" to "==John"
					set cell "Attendees::Last Name" to "==Smith"
				end tell
			end tell
			find
		end tell
	end tell
end tell


