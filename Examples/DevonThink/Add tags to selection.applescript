-- Add tags to selection
-- Created by Christian Grunenberg on Mon Aug 29 2011.
-- Copyright (c) 2009-2019. All rights reserved.

tell application id "DNtp"
	try
		set theSelection to the selection
		if theSelection is {} then error "Please select some items."
		
		repeat
			set theTag to display name editor "Add Tags" info "Tags (separated by semicolons):"
			if theTag is not "" then exit repeat
		end repeat
		
		set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, ";"}
		set theTags to text items of theTag
		repeat with theRecord in theSelection
			set tags of theRecord to (parents of theRecord) & theTags
		end repeat
		set AppleScript's text item delimiters to od
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
