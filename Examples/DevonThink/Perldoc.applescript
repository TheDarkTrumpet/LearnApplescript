-- Perldoc
-- Created by Christian Grunenberg on Sat Sep 17 2005.
-- Copyright (c) 2005-2019. All rights reserved.

tell application id "DNtp"
	try
		repeat
			set theCmd to display name editor "Perldoc" info "Enter the page, module, program or function:"
			if theCmd is not "" then exit repeat
		end repeat
		
		try
			set theOutput to do shell script "perldoc " & (quoted form of theCmd) & " | col -b"
			if length of theOutput is 0 then error
		on error
			set theOutput to do shell script "perldoc -f " & (quoted form of theCmd) & " | col -b"
		end try
		
		if length of theOutput is greater than 0 then
			create record with {name:theCmd, type:txt, plain text:theOutput} in current group
		else
			error "No documentation found for \"" & theCmd & "\"."
		end if
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell