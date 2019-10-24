to check_if_highest out of the_list above the_top
	repeat with the_item_ref in the_list
		if the_item_ref as number > the_top then return false
	end repeat
	return true
end check_if_highest


