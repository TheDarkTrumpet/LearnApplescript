tell application "FileMaker Pro"
	tell database "Inventory"
		tell table "equipment"
			tell (every record whose cell "model" is "DP-121")
				set cell "status" to "obsolete"
			end tell
		end tell
	end tell
end tell


