on choose_item_from_list(the_items)
	set the_selection to choose from list the_items
	if the_selection is false then
		error number -128 -- User canceled
	else
		return item 1 of the_selection
	end if
end choose_item_from_list


