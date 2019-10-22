-- Copy Comment to URL
-- Created by Christian Grunenberg on Mon Oct 02 2006.
-- Copyright (c) 2006-2019. All rights reserved.

tell application id "DNtp"
	try
		set this_selection to the selection
		if this_selection is {} then error "Please select some contents."
		show progress indicator "Updating Comments..."
		my copyComment(this_selection)
		hide progress indicator
	on error error_message number error_number
		hide progress indicator
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell

on copyComment(theseRecords)
	local this_record, this_comment, this_type
	tell application id "DNtp"
		repeat with this_record in theseRecords
			set this_type to type of this_record
			if this_type is group then
				step progress indicator (name of this_record as string)
				my copyComment(children of this_record)
			else
				set this_comment to the comment of this_record
				set the URL of this_record to this_comment
				set the comment of this_record to ""
			end if
		end repeat
	end tell
end copyComment
