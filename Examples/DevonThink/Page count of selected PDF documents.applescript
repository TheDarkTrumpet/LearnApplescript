-- Page count of selected PDF documents
-- Created by Christian Grunenberg on Aug Wed 24 2011.
-- Copyright (c) 20011-2019. All rights reserved.

tell application id "DNtp"
	try
		set theSelection to the selection
		set thePageCount to 0
		repeat with theRecord in theSelection
			set thePageCount to thePageCount + (page count of theRecord)
		end repeat
		if thePageCount is 0 then error "Please select some PDF documents."
		set theMessage to (thePageCount as string) & " pages."
		display alert "DEVONthink" message theMessage as informational
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell