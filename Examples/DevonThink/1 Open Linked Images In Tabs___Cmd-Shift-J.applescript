-- Open Linked Images In Tabs.
-- Created by Christian Grunenberg on Tue Dec 08 2009.
-- Copyright (c) 2009-2014. All rights reserved.

tell application id "DNtp"
	try
		if not (exists think window 1) then error "No windows are open."
		
		set theWindow to think window 1
		if not (exists source of theWindow) then error "No web page is visible."
		
		set theSource to source of theWindow
		set theURL to URL of theWindow
		set theLinks to get links of theSource base URL theURL
		set theImages to {}
		
		repeat with thisLink in theLinks
			if thisLink ends with ".jpg" or thisLink ends with ".JPG" or thisLink ends with ".jpeg" or thisLink ends with ".JPEG" or thisLink ends with ".gif" or thisLink ends with ".GIF" or thisLink ends with ".png" or thisLink ends with ".PNG" then set theImages to theImages & thisLink
		end repeat
		
		if theImages is {} then
			repeat with thisLink in theLinks
				if thisLink contains "photo.php" or thisLink contains "picture.php" or thisLink contains "/view.php" or thisLink contains ".com/photo2/" or (thisLink contains "gallery.php" and thisLink contains "&pic=") then set theImages to theImages & thisLink
			end repeat
		end if
		
		repeat with thisImage in theImages
			open tab for URL thisImage referrer theURL in theWindow
		end repeat
	on error error_message number error_number
		display alert "DEVONthink" message error_message as warning
	end try
end tell
