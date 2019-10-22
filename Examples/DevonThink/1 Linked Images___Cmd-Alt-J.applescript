-- Add Linked Images
-- Created by Christian Grunenberg on Jun Wed 16 2004.
-- Copyright (c) 2004-2019. All rights reserved.

tell application id "DNtp"
	try
		set added to false
		if not (exists think window 1) then error "No window is open."
		
		set theWindow to think window 1
		if not (exists source of theWindow) then error "No web page is visible."
		
		set this_source to the source of theWindow
		set this_URL to the URL of theWindow
		set these_links to get links of this_source base URL this_URL
		
		repeat with thisLink in these_links
			if thisLink ends with ".jpg" or thisLink ends with ".JPG" or thisLink ends with ".jpeg" or thisLink ends with ".JPEG" or thisLink ends with ".gif" or thisLink ends with ".GIF" or thisLink ends with ".png" or thisLink ends with ".PNG" then
				add download thisLink referrer this_URL without automatic
				set added to true
			end if
		end repeat
		if added is false then error "No linked images in this document"
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
