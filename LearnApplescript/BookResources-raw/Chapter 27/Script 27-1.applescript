on join_lines(the_list)
	set old_tids to AppleScript's text item delimiters
	set AppleScript's text item delimiters to linefeed
	set the_text to the_list as text
	set AppleScript's text item delimiters to old_tids
	return the_text
end join_lines


