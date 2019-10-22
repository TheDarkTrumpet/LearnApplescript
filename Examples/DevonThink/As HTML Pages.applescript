-- Downloads URLs as HTML Pages
-- Created by Christian Grunenberg on Fri Apr 25 2014.
-- Copyright (c) 2014. All rights reserved.

tell application id "DNtp"
	set theSelection to the selection
	if theSelection is not {} then
		try
			show progress indicator "Downloading..." steps (count of theSelection)
			repeat with theRecord in theSelection
				set theName to name of theRecord
				set theURL to URL of theRecord
				step progress indicator theName
				if theURL begins with "http:" or theURL begins with "https:" then
					set theParents to parents of theRecord
					set theSource to download markup from theURL
					set theCopy to create record with {name:theName, type:html, URL:theURL, source:theSource} in (item 1 of theParents)
					repeat with i from 2 to (count of theParents)
						replicate record theCopy to (item i of theParents)
					end repeat
					set creation date of theCopy to creation date of theRecord
					set comment of theCopy to comment of theRecord
					set rating of theCopy to rating of theRecord
					set label of theCopy to label of theRecord
					set state of theCopy to state of theRecord
				end if
			end repeat
			hide progress indicator
		on error error_message number error_number
			hide progress indicator
			if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
		end try
	end if
end tell