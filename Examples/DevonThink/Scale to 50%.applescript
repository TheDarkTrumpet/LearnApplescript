-- Scale to 50%
-- Created by Christian Grunenberg on Tue Apr 27 2004.
-- Copyright (c) 2004-2019. All rights reserved.
-- Based on (c) 2003 Apple, Inc.

tell application id "DNtp"
	try
		set this_selection to the selection
		if this_selection is {} then error "Please select some images."
		repeat with this_item in this_selection
			if the type of this_item is equal to picture then
				try
					set this_image to the image of this_item
					with timeout of 30 seconds
						tell application "Image Events"
							launch
							set this_file to open file this_image
							scale this_file by factor 0.5
							save this_file without icon
							close this_file
						end tell
					end timeout
				end try
			end if
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
