-- List concatenation test
set t to AMTime
set the_list to {}
repeat with i from 1 to 10000
	set the_list to the_list & {i}
end repeat
set t1 to (AMTime) - t
-- List appending test
set t to AMTime
set the_list to {}
repeat with i from 1 to 10000
	set end of the_list to i
end repeat
set t2 to (AMTime) - t
-- Compare the results
"concatenating=" & t1 & ", appending=" & t2
--> "concatenating=6.234330892563, appending=0.049731016159"


