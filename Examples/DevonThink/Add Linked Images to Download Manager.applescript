-- Add linked images (of feed) to download manager. Supports Facebook, Instagram and Flickr too.
-- Created by Christian Grunenberg on Dec 12 2013.
-- Copyright (c) 2013-2016. All rights reserved.

on performSmartRule(theRecords)
	tell application id "DNtp"
		repeat with theRecord in theRecords
			set theDatabase to database of theRecord
			
			set theSource to source of theRecord
			set theURL to URL of theRecord
			
			set isInstagram to false
			set isWebsta to false
			set isFlickr to false
			set isFacebook to false
			
			if theURL contains "facebook." and theURL contains "/photos/" then
				set theSource to download markup from theURL
				set isFacebook to true
			else if theURL contains "instagram." then
				set isInstagram to true
			else if theURL contains "websta." then
				set isWebsta to true
			else if theURL contains "flickr." and theURL contains "/photos/" then
				set theSource to download markup from theURL
				set isFlickr to true
			end if
			
			if isFlickr or isFacebook or isWebsta then my checkLinks(get embedded images of theSource base URL theURL, isFlickr, isFacebook, isInstagram, isWebsta, theURL, theDatabase)
			my checkLinks(get links of theSource base URL theURL, isFlickr, isFacebook, isInstagram, isWebsta, theURL, theDatabase)
		end repeat
	end tell
end performSmartRule

on checkLinks(theLinks, isFlickr, isFacebook, isInstagram, isWebsta, theReferrer, theDatabase)
	local add, thisLink
	tell application id "DNtp"
		repeat with thisLink in theLinks
			if thisLink contains ".jpg" or thisLink contains ".JPG" or thisLink contains ".jpeg" or thisLink contains ".JPEG" or thisLink contains ".jp2" or thisLink contains ".JP2" or thisLink contains "_n.png" then
				if thisLink does not contain "32x32" and thisLink does not contain "128x128" and thisLink does not contain "150x150" and thisLink does not contain "306x306" then
					set add to false
					if isFlickr then
						if thisLink does not contain "_n.jpg" and thisLink does not contain "/buddyicons/" then set add to true
					else if isWebsta then
						if thisLink contains "s320x320" then set thisLink to my replaceText(thisLink, "s320x320", "s1080x1080")
						set add to true
					else if not isFacebook and not isInstagram then
						set add to true
					else if thisLink contains "_n.jpg" or thisLink contains "_n.png" or thisLink contains "_o.jpg?dl=1" or thisLink contains "_o.png?dl=1" then
						set add to true
					end if
					if add and not (exists record with URL thisLink in theDatabase) then add download thisLink referrer theReferrer
				end if
			end if
		end repeat
	end tell
end checkLinks

on replaceText(theString, find, replace)
	if theString contains find then
		local od
		set od to text item delimiters of AppleScript
		set text item delimiters of AppleScript to find
		set theString to text items of theString
		
		set text item delimiters of AppleScript to replace
		set theString to "" & theString
		set text item delimiters of AppleScript to od
	end if
	return theString
end replaceText