tell application "Pages"
	tell paragraph 1 of document 1
		set font size to 45
		set font name to "Times New Roman"
		set bold to true
		set shadow to true
		set alignment to center
	end tell
	save document 1 in POSIX file "/Users/Shared/Examples.pages"
end tell


