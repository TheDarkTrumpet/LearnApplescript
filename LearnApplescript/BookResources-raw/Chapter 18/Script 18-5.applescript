on format_phone(the_phone_number)
	return "(" & (text 1 thru 3 of the_phone_number) & ") " & (text 4 thru 6 of the_phone_number) & "-" & (text 7 thru 10 of the_phone_number)
end format_phone


