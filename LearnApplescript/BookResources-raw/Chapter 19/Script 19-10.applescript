on _make_associative_list()
	script AssociativeList
		property class : "associative list"
		property the_items : {}

		on find_record_for_key(the_key)
			(* This is a private handler. Users should not use it directly. *)
			considering diacriticals, hyphens, punctuation and white space
				repeat with record_ref in my the_items
					if the_key of record_ref = the_key then return record_ref
				end repeat
			end considering
			return missing value
		end find_record_for_key

		-- Remaining handlers go here...
	end script
end _make_associative_list


