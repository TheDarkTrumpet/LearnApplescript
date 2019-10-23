-- Move to external folder
-- Created by Christian Grunenberg on Tue Apr 01 2014.
-- Copyright (c) 2014-2015. All rights reserved.

on performSmartRule(theRecords)
	tell application id "DNtp"
		repeat with theRecord in theRecords
			deconsolidate record theRecord
		end repeat
	end tell
end performSmartRule
