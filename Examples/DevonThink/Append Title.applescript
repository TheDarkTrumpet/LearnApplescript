-- Append To Title
-- Created by Christian Grunenberg on Aug 10 2009.
-- Copyright (c) 2009-2019. All rights reserved.

tell application id "DNtp"
	try
		if not (exists think window 1) then error "No window is open."
		if not (exists content record) then error "Please open a document."
		set theText to selected text of think window 1 as string
		if theText is missing value or theText is "" then error "No text is selected."
		set oldName to name of content record
		set newName to oldName & " " & theText
		set name of content record to newName
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell