-- Set name to title of web page
-- Created by Christian Grunenberg Mon Apr 26 2004.
-- Copyright (c) 2004-2019. All rights reserved.

tell application id "DNtp"
	try
		set this_selection to the selection
		set this_count to count of this_selection
		if this_count > 0 then
			show progress indicator "Renaming" steps this_count
			repeat with this_item in this_selection
				set this_type to the type of this_item
				set this_source to missing value
				step progress indicator (name of this_item) as string
				if this_type is equal to html or this_type is equal to webarchive then
					set this_source to source of this_item
				else if this_type is equal to bookmark then
					set this_URL to the URL of this_item
					if this_URL is not "" then set this_source to download markup from this_URL
				end if
				if this_source is not missing value then
					set this_title to get title of this_source
					if this_title is not missing value and this_title is not "" then set the name of this_item to this_title
				end if
			end repeat
			hide progress indicator
		end if
	on error error_message number error_number
		hide progress indicator
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
