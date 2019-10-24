tell application "FileMaker Pro"
	tell database "Inventory"
		tell table "equipment"
			tell record 1
				set the_date to cell "date purchased"
				set the_cost to cell "cost"
			end tell
		end tell
	end tell
end tell
{the_date, the_cost}


