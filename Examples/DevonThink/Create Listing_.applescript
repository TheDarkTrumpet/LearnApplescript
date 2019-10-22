-- Create Listing.
-- Created by Christian Grunenberg on Sun Jul 24 2005.
-- Copyright (c) 2005-2016. All rights reserved.

tell application id "DNtp"
	try
		if not (exists current database) then error "No database is open."
		set theDatabase to the current database
		set theFile to choose file name default name ((name of theDatabase) as string) & ".txt"
		
		show progress indicator "Creating Listing..." with cancel button
		
		set theListing to my createListing(children of root of theDatabase, "")
		if theListing is not missing value then
			set thePath to POSIX path of theFile
			if thePath does not end with ".txt" then set thePath to thePath & ".txt"
			
			set writeFile to open for access (thePath as POSIX file) with write permission
			set eof writeFile to 0
			write theListing to writeFile as Unicode text
			close access writeFile
		end if
		
		hide progress indicator
	on error error_message number error_number
		hide progress indicator
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell

on createListing(theseRecords, theTabs)
	local this_record, this_type, this_listing, group_listing, this_name
	tell application id "DNtp"
		set this_listing to ""
		repeat with this_record in theseRecords
			set this_name to (name of this_record as string)
			set this_listing to this_listing & theTabs & this_name & return
			set this_type to type of this_record
			if this_type is group then
				step progress indicator this_name
				set group_listing to my createListing(children of this_record, theTabs & (ASCII character 9))
				if group_listing is missing value or cancelled progress then return missing value
				set this_listing to this_listing & group_listing
			end if
		end repeat
	end tell
	return this_listing
end createListing
