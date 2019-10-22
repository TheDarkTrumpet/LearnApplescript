-- Add Images
-- Created by Christian Grunenberg on Jun Wed 16 2004.
-- Copyright (c) 2004-2014. All rights reserved.

tell application id "DNtp"
	try
		if not (exists think window 1) then error "No window is open."
		
		set this_URL to the URL of think window 1
		set this_source to the source of think window 1
		set these_links to get embedded images of this_source base URL this_URL
		if the (count of these_links) is 0 then error "No images in this document"
		repeat with this_link in these_links
			add download this_link referrer this_URL without automatic
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
