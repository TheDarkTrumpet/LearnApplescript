tell application "FileMaker Pro"
	tell database "Campaign"
		tell table "donors"
			tell (every record whose cell "state" = "RI" and cell "income" > 100000)
				set address_list to cell "address"
				set phone_list to cell "tel01"
				set name_list to cell "full name"
			end tell
		end tell
	end tell
end tell


