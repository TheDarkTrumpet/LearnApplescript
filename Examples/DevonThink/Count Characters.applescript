-- Count Characters.
-- Created by Christian Grunenberg on Mon Jun 07 2004.
-- Copyright (c) 2004-2019. All rights reserved.

tell application id "DNtp"
	try
		set this_selection to the selection
		if this_selection is {} then error "Please select some contents."
		show progress indicator "Counting characters" steps -1
		set this_characters to my countCharacters(this_selection)
		hide progress indicator
		display alert "DEVONthink" message (this_characters as string) & " characters."
	on error error_message number error_number
		hide progress indicator
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell

on countCharacters(these_childs)
	local this_child, this_count
	tell application id "DNtp"
		set this_count to 0
		repeat with this_child in these_childs
			set this_count to this_count + (character count of this_child)
			set this_count to this_count + (my countCharacters(children of this_child))
		end repeat
	end tell
	return this_count
end countCharacters
