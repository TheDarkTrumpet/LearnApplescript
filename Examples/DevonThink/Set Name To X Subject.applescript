-- Set name to subject
-- Created by Christian Grunenberg Wed Feb 19 2009.
-- Copyright (c) 2009-2019. All rights reserved.

tell application id "DNtp"
	try
		set theSelection to the selection
		if theSelection is {} then error "Please select some contents."
		repeat with theRecord in theSelection
			try
				set theMD to meta data of theRecord
				try
					set theSubject to |kMDItemSubject| of theMD
				on error
					set theSubject to |kMDItemHeadline| of theMD
				end try
				set name of theRecord to theSubject
			end try
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
