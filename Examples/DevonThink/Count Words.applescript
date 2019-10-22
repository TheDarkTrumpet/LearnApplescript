-- Count Words.
-- Created by Christian Grunenberg on Sun Jun 06 2004.
-- Copyright (c) 2004-2019. All rights reserved.

tell application id "DNtp"
	try
		set this_selection to the selection
		if this_selection is {} then error "Please select some contents."
		set this_words to my countWords(this_selection)
		display alert "DEVONthink" message (this_words as string) & " words."
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell

on countWords(these_childs)
	local this_child, this_count
	tell application id "DNtp"
		set this_count to 0
		repeat with this_child in these_childs
			set this_count to this_count + (word count of this_child)
			set this_count to this_count + (my countWords(children of this_child))
		end repeat
	end tell
	return this_count
end countWords
