-- Import Pinboard bookmarks
-- Created by Christian Grunenberg on Mon Jan 23 2006.
-- Modified by Rafael Bugajewski to support Pinboard instead of Delicious on Sun Dec 19 2010.
-- Modified by Andreas Zeitler on Sun Mar 03 2011 to display user feedback when finished
-- Copyright (c) 2006-2019. All rights reserved.

-- If the properties pUser and pPassword are undefined then a dialog pops up asking for these properties
property pUser : ""
property pPassword : ""

tell application id "DNtp"
	try
		if (pUser is "") or (pPassword is "") then
			repeat while (pUser is "") or (pPassword is "")
				set theResult to display authentication dialog "Pinboard" & return & "https://api.pinboard.in/v1/posts/all"
				set pUser to user of theResult
				set pPassword to |password| of theResult
			end repeat
		end if
		
		set theXML to download markup from "https://api.pinboard.in/v1/posts/all" user pUser password pPassword encoding "UTF-8"
		
		if theXML is missing value or theXML is "" then
			error "Download failed."
		else if theXML contains "503 Service Temporarily Unavailable" then
			error "503 Service Temporarily Unavailable"
		else
			try
				tell application "System Events"
					set x to make new XML data with data theXML
					set theElements to XML elements of (XML element 1 of x) -- posts
					tell application id "DNtp"
						set theGroup to get record at "/Pinboard"
						if theGroup is missing value or type of theGroup is not group then
							set theGroup to create location "/Pinboard"
							set thumbnail of theGroup to "http://pinboard.in/bluepin.gif"
						end if
					end tell
					repeat with theElement in theElements
						set theUrl to (value of XML attribute named "href" of theElement) as string
						set theName to (value of XML attribute named "description" of theElement) as string
						set theTag to (value of XML attribute named "tag" of theElement) as string
						
						set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, " "}
						try
							set theTags to (text items of theTag)
						on error
							set theTags to {}
						end try
						set AppleScript's text item delimiters to od
						
						tell application id "DNtp"
							if not (exists record with URL theUrl) then create record with {name:theName, type:bookmark, URL:theUrl, tags:theTags} in theGroup
						end tell
					end repeat
				end tell
			on error msg
				set pUser to ""
				set pPassword to ""
				error "Invalid user/password."
			end try
		end if
		
		-- when the script is finished it should tell the user
		tell application "Finder"
			if exists POSIX file "/System/Library/Sounds/Glass.aiff" then
				do shell script "afplay /System/Library/Sounds/Glass.aiff"
			end if
			display dialog "Import has finished."
		end tell
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
