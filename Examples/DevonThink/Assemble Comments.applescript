-- Assemble Comments
-- Created by Christian Grunenberg on Tue Dec 07 2004.
-- Copyright (c) 2004-2014. All rights reserved.

tell application id "DNtp"
	try
		set these_items to the selection
		if these_items is {} then error "Please select some contents."
		set theAssemble to ""
		set theCnt to 0
		repeat with this_item in these_items
			set this_comment to the comment of this_item
			if length of this_comment > 0 then
				set this_name to name of this_item
				set theAssemble to theAssemble & this_name & ":" & return & this_comment & return & return
				set theCnt to theCnt + 1
			end if
		end repeat
		
		if (theCnt > 0) then
			create record with {name:(theCnt as string) & " comments", type:txt, plain text:theAssemble} in current group
		end if
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
