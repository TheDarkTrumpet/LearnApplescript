-- Close All Databases (on quit)
-- Created by Christian Grunenberg on Mon Oct 13 2014.
-- Copyright (c) 2014-2015. All rights reserved.

on performSmartRule(theRecords)
	tell application id "DNtp"
		try
			tell every database to close
		end try
	end tell
end performSmartRule
