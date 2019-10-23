-- Add embedded images (of feed) to download manager
-- Created by Christian Grunenberg on May 02 2014.
-- Copyright (c) 2014-2015. All rights reserved.

on performSmartRule(theRecords)
	tell application id "DNtp"
		repeat with theRecord in theRecords
			set theDatabase to database of theRecord
			
			set theSource to source of theRecord
			set theURL to URL of theRecord
			set theLinks to get embedded images of theSource base URL theURL
			
			repeat with thisLink in theLinks
				if thisLink contains ".jpg" or thisLink contains ".JPG" or thisLink contains ".jpeg" or thisLink contains ".JPEG" or thisLink contains ".jp2" or thisLink contains ".JP2" then
					if not (exists record with URL thisLink in theDatabase) then add download thisLink referrer theURL
				end if
			end repeat
		end repeat
	end tell
end performSmartRule
