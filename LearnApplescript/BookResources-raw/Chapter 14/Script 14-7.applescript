set name_list to {"Ben", "Jen", "Sten"}
repeat with the_name in name_list
	display dialog the_name
	if the_name is equal to "Jen" then
		display dialog "Hiya, Jenny!"
	end if
end repeat 


