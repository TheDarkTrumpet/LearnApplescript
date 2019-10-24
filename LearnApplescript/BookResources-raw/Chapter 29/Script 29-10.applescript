 on quicksort(the_list)
	 script FastList
		 property fast_list : the_list
	 end script
	 if (count FastList's fast_list) ≤ 1 then
		 return FastList's fast_list
	 else
		 set pivot_index to (count FastList's fast_list) div 2
		 set pivot_value to item pivot_index of FastList's fast_list
		 set lesser_list to {}
		 set greater_list to {}
		 repeat with range_ref in {{start_index:1, end_index:pivot_index - 1}, {start_index:pivot_index + 1, end_index:count FastList's fast_list}}
			 repeat with i from start_index of range_ref to end_index of range_ref
				 set the_item to item i of FastList's fast_list
				 if the_item ≤ pivot_value then
					 set end of lesser_list to the_item
				 else
					 set end of greater_list to the_item
				 end if
			 end repeat
		 end repeat
		 return quicksort(lesser_list) & {pivot_value} & quicksort(greater_list)
	 end if
 end quicksort


