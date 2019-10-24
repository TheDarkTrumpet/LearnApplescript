index_of_item_in_list("Jim", {"Mary", "Al", "Jim", "Sal"})

on index_of_item_in_list(the_item, the_list)
	script FastList
		property fast_list : the_list
	end script
	repeat with i from 1 to length of FastList's fast_list
		if item i of FastList's fast_list = the_item then return i
	end repeat
	error "Item not found." number -1728 from the_item
end index_of_item_in_list


