on make_case_insensitive_associative_list()
	script CaseInsensitiveAssociativeList
		property parent : _make_associative_list()

		on find_record_for_key(the_key)
			ignoring case
				return continue find_record_for_key(the_key)
			end ignoring
		end find_record_for_key
	end script
end make_case_insensitive_associative_list

on make_case_sensitive_associative_list()
	script CaseSensitiveAssociativeList
		property parent : _make_associative_list()

		on find_record_for_key(the_key)
			considering case
				return continue find_record_for_key(the_key)
			end considering
		end find_record_for_key
	end script
end make_case_sensitive_associative_list


