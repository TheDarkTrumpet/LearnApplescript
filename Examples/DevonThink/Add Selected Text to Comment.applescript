-- Add selected text to comment
-- Created by Christian Grunenberg on Sep Wed 19 2007.
-- Copyright (c) 2007-2014. All rights reserved.

tell application id "DNtp"
	try
		if not (exists think window 1) then error "No window open."
		if not (exists content record) then error "No document selected."
		
		set this_text to the selected text of think window 1 as string
		if this_text is "" then error "No text selected."
		
		set this_record to content record
		set this_comment to comment of this_record as string
		if this_comment is not "" then set this_comment to this_comment & return
		set comment of this_record to (this_comment & this_text) as string
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell