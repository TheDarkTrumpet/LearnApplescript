-- Convert comments to tags
-- Created by Christian Grunenberg on Wed Oct 14 2009.
-- Copyright (c) 2009-2019. All rights reserved.

tell application id "DNtp"
	try
		set these_items to the selection
		if these_items is {} then error "Please select some contents."
		
		repeat with this_item in these_items
			set this_comment to the comment of this_item
			if this_comment is not "" then
				set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, ","}
				set theTags to text items of this_comment
				set AppleScript's text item delimiters to od
				set theTags to (parents of this_item) & theTags
				set the tags of this_item to theTags
				set the comment of this_item to ""
			end if
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell

