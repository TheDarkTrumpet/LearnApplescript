on split_name(the_name)
	set first_name to first word of the_name
	set last_name to last word of the_name
	return {forename:first_name, surname:last_name}
end split_name
set name_record to split_name("Paul Revere")


