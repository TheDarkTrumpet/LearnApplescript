tell application "Finder"
	tell home
		open
		tell container window
			set bounds to {40, 40, 800, 800}
			set current view to list view
			tell its list view options -- Equivalent to: tell list view options of it
				set calculates folder sizes to true
				set sort column to column id modification date column
			end tell
		end tell
	end tell
end tell


