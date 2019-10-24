set default_area_code to "201"
set phone_list to {"475-5556145", "5559132", "5557040", "317-5551437", "5556421"}

repeat with i from 1 to count phone_list
	if length of (item i of phone_list) is 7 then
		set item i of phone_list to default_area_code & "-" & (item i of phone_list)
	end if
end repeat

phone_list


