tell application "FileMaker Pro"
	tell database "Inventory"
		tell window 1
			go to layout "equipment"
			tell current record
				set the_date to cell "date purchased"
				set the_cost to cell "cost"
			end tell
		end tell
	end tell
end tell
{the_date, the_cost}


