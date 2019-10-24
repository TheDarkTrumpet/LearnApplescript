set name_list to {"Ben", "Jen", "Sten"}
repeat with the_name_ref in name_list
	display dialog the_name
	if (contents of the_name_ref) is equal to "Jen" then
		display dialog "Hiya, Jenny!"
	end if
end repeat 


