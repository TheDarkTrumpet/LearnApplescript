on find_position_in_list(the_list, the_value)
	repeat with i from 1 to count the_list
		if item i of the_list is the_value then return i
	end repeat
	error "Value not found."
end find_position_in_list


