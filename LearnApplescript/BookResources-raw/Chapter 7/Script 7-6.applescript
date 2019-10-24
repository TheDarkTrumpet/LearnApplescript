set the_phone_number to "(800) 555-1212"
set text item delimiters to {"(", ")", "-", " "}
set the_list to text items of the_phone_number
set text item delimiters to ""
set the_cleaned_phone_number to the_list as text


