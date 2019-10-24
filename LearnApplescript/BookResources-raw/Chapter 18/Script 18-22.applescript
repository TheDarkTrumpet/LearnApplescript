on make_associative_list()
	(* Make a new associative list that stores values using any objects as keys.

		Result: an associative list

		Note: Users should not directly manipulate the contents of the returned 
		object. Instead, use the handlers provided to work with it safely.
	*)
	return {class:"associative list", the_items:{}}
end make_associative_list


on find_record_for_key(the_assoc_list, the_key)
	(* This is a private handler. Users should not use it directly. *)
	considering diacriticals, hyphens, punctuation and white space but ignoring case
		repeat with record_ref in the_items of the_assoc_list
			if the_key of record_ref = the_key then return record_ref
		end repeat
	end considering
	return missing value -- The key wasn't found
end find_record_for_key


on get_associative_item(the_assoc_list, the_key)
	(*
		Get the value for the given key in an associative list.

		the_assoc_list : associative list
		the_key : anything -- the key to search for
		Result : anything -- the value, if found

		Note: Raises error -1728 if the key isn't found.
	*)
	set record_ref to find_record_for_key(the_assoc_list, the_key)
	if record_ref = missing value then
		error "The key wasn't found." number -1728 from the_key
	end if
	return the_value of record_ref
end get_associative_item


on set_associative_item(the_assoc_list, the_key, the_value)
	(*
		Set the value for the given key in an associative list.

		the_assoc_list : associative list
		the_key : anything -- the key to use
		the_value : anything -- the new value
	*)
	set record_ref to find_record_for_key(the_assoc_list, the_key)
	if record_ref = missing value then
		set end of the_items of the_assoc_list to {the_key:the_key, the_value:the_value}
	else
		set the_value of record_ref to the_value
	end if
	return -- No return value; the handler modifies the existing associative list.
end set_associative_item


on count_associative_items(the_assoc_list)
	(*
		Return the number of items in an associative list.

		the_assoc_list : associative list
		Result : integer
	*)
	return count the_items of the_assoc_list
end set_associative_item


on delete_associative_item(the_assoc_list, the_key)
	(*
		Delete the value for the given key.

		the_assoc_list : associative list
		the_key : anything -- the key to delete
	*)
	set record_ref to find_record_for_key(the_assoc_list, the_key)
	if record_ref is missing value then
		error "The key wasn't found." number -1728 from the_key
	end if
	set contents of record_ref to missing value
	set the_items of the_assoc_list to every record of the_items of the_assoc_list
	return -- No return value; the handler modifies the existing associative list.
end delete_associative_item

