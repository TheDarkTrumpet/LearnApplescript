on index_of_item_in_sorted_list(the_list, the_item)
	-- Caution: this only works on fully sorted lists
	script FastList
		property fast_list : the_list
	end script
	set lo to 0
	set hi to length of FastList's fast_list
	repeat while lo < hi
		set mid to (lo + hi) div 2
		if the_item < FastList's fast_list's item (mid + 1) then
			set hi to mid
		else
			set lo to mid + 1
		end if
	end repeat
	if item lo of FastList's fast_list ≠ the_item then
		error "Item not found." number -1728 from the_item
	end if
	return lo
end index_of_item_in_sorted_list


