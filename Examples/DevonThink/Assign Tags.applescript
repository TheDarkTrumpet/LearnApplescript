-- Assign Tags
-- Created by Christian Grunenberg on Jun 02 2014.
-- Copyright (c) 2014-2016. All rights reserved.

property pMaxTags : 5

on performSmartRule(theRecords)
	tell application id "DNtp"
		repeat with theRecord in theRecords
			set theTags to extract keywords from record theRecord with existing tags and hash tags
			set n to count of theTags
			if n > 0 then
				if n > pMaxTags then set n to pMaxTags
				set tags of theRecord to (parents of theRecord) & (items 1 thru n of theTags)
			end if
		end repeat
	end tell
end performSmartRule