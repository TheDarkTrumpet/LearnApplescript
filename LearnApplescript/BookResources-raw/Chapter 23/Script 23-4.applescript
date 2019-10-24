activate application "Preview"
tell application "System Events"
	tell process "Preview"
		click menu item "Find…"  of menu 1 of menu item "Find" of menu 1 of menu bar item "Edit"  of menu bar 1
		tell window 1
			-- Perform the search
			set value of text field 1 of group 3 of tool bar 1 to "beep"
		end tell
	end tell
end tell


