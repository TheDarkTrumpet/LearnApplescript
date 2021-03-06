-- Open Location in Tab
-- Created by Christian Grunenberg Thu Dec 17 2009.
-- Copyright (c) 2010–2019. All rights reserved.

-- Import helper library
tell application "Finder" to set pathToAdditions to ((path to application id "DNtp" as string) & "Contents:Resources:Template Script Additions.scpt") as alias
set helperLibrary to load script pathToAdditions

tell application id "DNtp"
	try
		repeat
			set theURL to display name editor "Open Location" info "URL:" default answer "http://"
			if theURL is not "" and theURL is not "http://" then
				-- Open URL in a new tab
				my helperLibrary's openURLInTab(theURL)
				exit repeat
			end if
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell