activate application "Preview"
tell application "System Events"
	tell process "Preview"
		click menu item "Find…"  of menu 1 of menu item "Find" of menu 1 of menu bar item "Edit"  of menu bar 1
		tell window 1
			-- Perform the search
			set value of text field 1 of group 3 of tool bar 1 to "beep"
			delay 1
			-- Get the search results from the sidebar
			tell rows 2 thru -1 of outline 1 of scroll area 2 of splitter group 1
				set page_numbers to value of text field 1
				set page_relevances to value of relevance indicator 1
			end tell
		end tell
	end tell
end tell
{page_numbers, page_relevances}


