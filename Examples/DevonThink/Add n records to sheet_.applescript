-- Add n records to sheet
-- Created by Christian Grunenberg on Fri Oct 13 2005.
-- Copyright (c) 2005-2019. All rights reserved.

tell application id "DNtp"
	try
		if not (exists think window 1) then error "No window is open."
		
		set theWindow to think window 1
		set theRecord to content record of theWindow
		if (theRecord is missing value) or (type of theRecord is not sheet) then error "Please select a sheet."
		
		repeat
			set theCount to (display name editor "Add Records" info "Number (1-999) of records:") as integer
			if theCount ≥ 1 and theCount ≤ 999 then exit repeat
		end repeat
		
		tell theWindow
			set n to number of rows
			repeat with i from 1 to theCount
				set theCells to {(i + n) as string}
				if not (add row cells theCells) then exit repeat
			end repeat
		end tell
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell