-- Remove tags from selection
-- Created by Snare Dubes on Mon Feb 19 2012.
-- Copyright (c) 2012-2019. All rights reserved.

tell application id "DNtp"
	try
		set theSelection to the selection
		if theSelection is {} then error "Please select some items."
		
		repeat
			set theTag to display name editor "Remove Tags" info "Tags (separated by semicolons):"
			if theTag is not "" then exit repeat
		end repeat
		
		set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, ";"}
		set toRemoveTags to text items of theTag
		repeat with theRecord in theSelection
			set origTags to tags of theRecord
			set reduTags to {}
			repeat until origTags = {}
				set oneTag to (first item of origTags)
				set origTags to (rest of origTags)
				considering case
					if oneTag is not in toRemoveTags then
						set reduTags to reduTags & {oneTag}
					end if
				end considering
			end repeat
			set tags of theRecord to reduTags
		end repeat
		set AppleScript's text item delimiters to od
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell