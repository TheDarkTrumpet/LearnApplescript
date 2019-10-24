on make_associative_list()
	script AssociativeList
		property class : "associative list"
		property the_items : {}

		on find_record_for_key(the_key)
			(* This is a private handler. Users should not use it directly. *)
			considering diacriticals, hyphens, punctuation and white space but ignoring case
				repeat with record_ref in my the_items
					if the_key of record_ref = the_key then return record_ref
				end repeat
			end considering
			return missing value
		end find_record_for_key

		on set_item(the_key, the_value)
			set record_ref to find_record_for_key(the_key)
			if record_ref = missing value then
				set end of my the_items to {the_key:the_key, the_value:the_value}
			else
				set the_value of record_ref to the_value
			end if
			return
		end set_item

		on get_item(the_key)
			set record_ref to find_record_for_key(the_key)
			if record_ref = missing value then
				error "The key wasn't found." number -1728 from the_key
			end if
			return the_value of record_ref
		end get_item

		on count_items()
			return count my the_items
		end count_items

		on delete_item(the_key)
			set record_ref to find_record_for_key(the_key)
			if record_ref is missing value then
				error "The key wasn't found." number -1728 from the_key
			end if
			set contents of record_ref to missing value
			set my the_items to every record of my the_items
			return
		end delete_item
	end script
end make_associative_list


