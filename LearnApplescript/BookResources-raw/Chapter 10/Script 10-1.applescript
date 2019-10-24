on remove_item_from_list(the_list, index_to_remove)
	if index_to_remove = 1 then
		set new_list to rest of the_list
	else if index_to_remove = length of the_list then
		set new_list to (items 1 thru -2 of the_list)
	else
		set new_list to (items 1 thru (index_to_remove - 1) of the_list) & (items (index_to_remove + 1) thru -1 of the_list)
	end if
	return new_list
end remove_item_from_list


