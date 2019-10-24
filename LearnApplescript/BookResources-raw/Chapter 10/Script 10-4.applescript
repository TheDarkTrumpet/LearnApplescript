 on bubblesort(the_list)
	 set is_sorted to false
	 repeat until is_sorted
		 set is_sorted to true
		 repeat with i from 1 to (length of the_list) – 1
			 if item i of the_list > item (i + 1) of the_list then
				 set {item i of the_list, item (i + 1) of the_list} to {item (i + 1) of the_list, item i of the_list}
				 set is_sorted to false
			 end if
		 end repeat
	 end repeat
 end bubblesort


