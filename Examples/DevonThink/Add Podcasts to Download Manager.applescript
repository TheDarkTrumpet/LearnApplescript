-- Add podcasts (of feed) to download manager
-- Created by Christian Grunenberg on Dec 12 2013.
-- Copyright (c) 2013-2015. All rights reserved.

on performSmartRule(theRecords)
	tell application id "DNtp"
		repeat with theRecord in theRecords
			set theDatabase to database of theRecord
			
			set theSource to source of theRecord
			set theURL to URL of theRecord
			set theLinks to get links of theSource base URL theURL
			
			repeat with thisLink in theLinks
				if not (exists record with URL thisLink in theDatabase) then add download thisLink referrer theURL
			end repeat
		end repeat
	end tell
end performSmartRule