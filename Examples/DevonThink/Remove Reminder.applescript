-- Remove Reminder
-- Created by Christian Grunenberg on Wed Feb 04 2015.
-- Copyright (c) 2015. All rights reserved.

on performSmartRule(theRecords)
	tell application id "DNtp"
		repeat with theRecord in theRecords
			set reminder of theRecord to missing value
		end repeat
	end tell
end performSmartRule