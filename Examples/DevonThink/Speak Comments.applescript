-- Speak Comments
-- Created by Christian Grunenberg on Sun Apr 25 2004.
-- Copyright (c) 2004-2014. All rights reserved.
-- Based on (c) 2003 Apple, Inc.

tell application id "DNtp"
	try
		set these_items to the selection
		if these_items is {} then error "Please select some contents."
		repeat with this_item in these_items
			set this_comment to the comment of this_item
			try
				if (count of these_items) is greater than 1 then set the selection of think window 1 to {this_item}
			end try
			if this_comment is not "" then say (this_comment as string)
			delay 1
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
