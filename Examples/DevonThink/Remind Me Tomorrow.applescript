-- Remind me tomorrow
-- Created by Christian Grunenberg on Thu Jan 15 2015.
-- Copyright (c) 2015. All rights reserved.

on performSmartRule(theRecords)
	tell application id "DNtp"
		set due_date to current date
		set due_date to due_date + 3600 * 24
		repeat with theRecord in theRecords
			tell theRecord to make new reminder with properties {schedule:once, alarm:notification, due date:due_date}
		end repeat
	end tell
end performSmartRule