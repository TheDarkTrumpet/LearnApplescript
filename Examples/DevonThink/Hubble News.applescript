-- Nature's Hubble News
-- Created by Christian Grunenberg on May Fri 14 2004.
-- Copyright (c) 2004-2019. All rights reserved.

property pDestination : "/Nature's News"
property pTopics : {"Hubble"}
property pURL : "https://www.nature.com/news"

tell application id "DNtp"
	try
		show progress indicator "Checking latest news..." steps -1
		
		with timeout of 60 seconds
			set this_HTML to download markup from pURL
			
			set these_links to {}
			repeat with this_topic in pTopics
				set these_links to these_links & (get links of this_HTML containing this_topic base URL pURL)
			end repeat
			
			if these_links is {} then error "No news found."
			
			show progress indicator "Adding news..." steps (count of these_links)
			
			set news_added to false
			set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, "/"}
			repeat with this_link in these_links
				if not (exists record with URL this_link) then
					set this_news to download markup from this_link
					set this_title to get title of this_news
					step progress indicator this_title
					if not news_added then
						set this_group to create location pDestination
						set news_added to true
					end if
					create record with {name:this_title, type:html, URL:this_link, source:this_news} in this_group
				else
					exit repeat
				end if
			end repeat
			set AppleScript's text item delimiters to od
			if not news_added then error "No news found."
		end timeout
		hide progress indicator
	on error error_message number error_number
		hide progress indicator
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
