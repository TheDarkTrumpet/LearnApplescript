-- Replace Text in Names
-- Created by Christian Grunenberg Sat May 15 2004.
-- Copyright (c) 2004-2019. All rights reserved.
-- Based on (c) 2001 Apple, Inc.

tell application id "DNtp"
	try
		set this_selection to the selection
		if this_selection is {} then error "Please select some contents."
		
		repeat
			set search_string to display name editor "Replace Text" info "Enter text to find:"
			if search_string is not "" then exit repeat
		end repeat
		
		set replacement_string to display name editor "Replace Text" info "Enter replacement text:"
		
		set od to AppleScript's text item delimiters
		repeat with this_item in this_selection
			set current_name to name of this_item
			if current_name contains search_string then
				set AppleScript's text item delimiters to search_string
				set text_item_list to every text item of current_name
				set AppleScript's text item delimiters to replacement_string
				set new_item_name to text_item_list as string
				set the name of this_item to new_item_name
			end if
		end repeat
		set AppleScript's text item delimiters to od
		
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
