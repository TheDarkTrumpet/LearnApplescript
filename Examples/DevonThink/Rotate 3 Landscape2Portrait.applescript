-- Rotate Lanscape-to-Portrait
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
					set image_width to the width of this_item
					set image_height to the height of this_item
					if image_width > image_height then
						set this_image to the image of this_item
						with timeout of 30 seconds
							tell application "Image Events"
								launch
								set this_file to open file this_image
								rotate this_file to angle 90
								save this_file without icon
								close this_file
							end tell
						end timeout
					end if
				end try
			end if
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
