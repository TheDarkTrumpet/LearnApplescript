set asset_tags to {"AB-222", "AB-223", "AB-224", "AB-225", "AB-226"}
tell application "FileMaker Pro"
	tell database "Inventory"
		tell layout "equipment" of window 1
			set field "asset tags" to asset_tags
		end tell
	end tell
end tell


