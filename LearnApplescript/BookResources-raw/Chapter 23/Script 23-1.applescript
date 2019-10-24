on adding folder items to this_folder after receiving dropped_items
	repeat with alias_ref in dropped_items
		set label_index to random number from 1 to 6
		tell application "Finder"
			set label index of alias_ref to label_index
		end tell
	end repeat
end adding folder items to


