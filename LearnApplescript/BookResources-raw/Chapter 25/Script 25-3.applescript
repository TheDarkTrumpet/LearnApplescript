tell application "FileMaker Pro"
	tell database "Inventory"
		tell record 3 of table "equipment"
			get cellValue of cell "cost"
		end tell
	end tell
end tell

tell application "FileMaker Pro"
	tell database "Inventory"
		tell record 3 of table "equipment"
			get cell "cost"
		end tell
	end tell
end tell



