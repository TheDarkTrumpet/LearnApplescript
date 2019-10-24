 set potato_list to {"small potato", "big potato", "banged potato", "round potato"}
 set nice_potato_list to {}
 repeat with i from 1 to (length of potato_list)
	 set the_potato to item i of potato_list
	 if {the_potato} is not in {"banged potato", "moldy potato"} then
		 set end of nice_potato_list to the_potato
	 end if
 end repeat
 nice_potato_list


