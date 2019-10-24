tell application "System Events"
	set login_item_names to name of every login item
	set the_selection to choose from list login_item_names OK button name "Delete"
	if the_selection is not false then
		set selected_name to item 1 of the_selection
		delete login item selected_name
	end if
end tell


