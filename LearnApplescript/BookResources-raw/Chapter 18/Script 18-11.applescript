to find_highest out of the_list
	set highest_for_now to item 1 of the_list as number
	repeat with the_item_ref in rest of the_list
		if the_item_ref as number > highest_for_now then
			set highest_for_now to the_item_ref as number
		end if
	end repeat
	return highest_for_now
end find_highest


