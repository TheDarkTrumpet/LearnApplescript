-- Flip Vertical
-- Created by Christian Grunenberg on Sat Feb 12 2004.
-- Copyright (c) 2005-2019. All rights reserved.
-- Based on (c) 2003 Apple, Inc.

tell application id "DNtp"
	try
		set this_selection to the selection
		if this_selection is {} then error "Please select some contents."
		repeat with this_item in this_selection
			if exists thumbnail of this_item then
				try
					set this_thumb to thumbnail of this_item
					set this_path to my writeData(this_thumb)
					with timeout of 30 seconds
						tell application "Image Events"
							launch
							set this_file to open file this_path
							flip this_file with vertical
							close this_file saving yes
						end tell
					end timeout
					set the thumbnail of this_item to this_path
				end try
			end if
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell

on writeData(theData)
	local theFileRef, thePath
	set thePath to POSIX path of (path to temporary items from user domain)
	set thePath to thePath & "/_DEVONthink_thumbnail_.tiff"
	set theFileRef to open for access POSIX file thePath with write permission
	set eof of theFileRef to 0
	write theData to theFileRef
	close access theFileRef
	return thePath
end writeData
