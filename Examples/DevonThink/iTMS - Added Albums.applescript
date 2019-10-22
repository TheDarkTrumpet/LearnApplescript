-- iTMS - Added Albums
-- Created by Christian Grunenberg on Jun Fri 25 2004.
-- Copyright (c) 2004-2019. All rights reserved.

property pDestination : "/iTMS - Added Albums"

tell application id "DNtp"
	try
		-- See iTunes Music Store RSS Feed Generator
		-- URL: https://rss.itunes.apple.com
		
		set this_URL to "https://rss.itunes.apple.com/api/v1/us/itunes-music/new-music/all/100/explicit.atom"
		
		show progress indicator "Downloading iTMS feed..." steps -1
		
		with timeout of 300 seconds
			set this_RSS to download markup from this_URL
			set this_HTML to convert feed to HTML this_RSS
			set these_items to get items of feed this_RSS
			set these_images to get embedded images of this_HTML type "PNG" base URL this_URL
			if (count of these_images) = (count of these_items) then
				
				show progress indicator "Downloading Covers..." steps (count of these_images)
				
				set i to 1
				set this_group to create location pDestination
				
				repeat with this_item in these_items
					set this_name to my replaceCharacter(title of this_item, "/", "-")
					set this_link to link of this_item
					set this_image to item i of these_images
					
					step progress indicator this_name
					
					if not (exists record at (pDestination & "/" & this_name)) then
						set this_URL to "itms://" & (characters 8 thru -1 of this_link)
						set this_record to create record with {name:this_name, type:bookmark, URL:this_URL, date:|date| of this_item} in this_group
						set thumbnail of this_record to this_image
					end if
					set i to i + 1
				end repeat
				
			end if
		end timeout
	end try
	hide progress indicator
end tell

on replaceCharacter(theString, theOriginalChar, theNewChar)
	set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, theOriginalChar}
	set theStringParts to text items of theString
	if (count of theStringParts) is greater than 1 then
		set theString to text item 1 of theStringParts as string
		repeat with eachPart in items 2 thru -1 of theStringParts
			set theString to theString & theNewChar & eachPart as string
		end repeat
	end if
	set AppleScript's text item delimiters to od
	return theString
end replaceCharacter
