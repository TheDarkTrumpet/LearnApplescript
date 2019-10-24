set s to "1234567890"
set n to 10000

set t to AMTime
set the_string to ""
repeat n times
	set the_string to the_string & s
end repeat
set t1 to (AMTime) - t

set t to AMTime
set temp_list to {}
repeat n times
	set end of temp_list to s
end repeat
set AppleScript's text item delimiters to ""
set the_string to temp_list as text
set t2 to (AMTime) - t

"concatenating=" & t1 & ", appending=" & t2


