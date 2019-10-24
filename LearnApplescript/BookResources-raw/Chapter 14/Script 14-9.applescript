set default_area_code to "201"
set phone_list to {"204-5556145", "5559132", "5557040", "307-5551437", "5556421"}

repeat with phone_ref in phone_list
	if length of phone_ref is 7 then
		set contents of phone_ref to default_area_code & "-" & phone_ref
	end if
end repeat

phone_list


