tell application "FileMaker Pro"
	tell database "Inventory"
		tell table "equipment"
			show (every record whose cell "category" is "miscellaneous")
		end tell
		tell layout "equipment" of window 1
			sort by field "cost"
			set cost_list to field "cost"
		end tell
	end tell
end tell
cost_list


