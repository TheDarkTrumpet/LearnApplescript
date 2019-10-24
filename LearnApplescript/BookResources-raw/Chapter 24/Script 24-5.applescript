set display_info to do shell script "system_profiler SPDisplaysDataType | " & "grep 'Main Display:' -B 4 | grep 'Resolution:'"
set theme_width to (word 2 of display_info) as number 
set theme_height to (word 4 of display_info) as number

tell application "Keynote" 
	activate
	set the_selection  to choose from list (get name of every appTheme)
	if the_selection  is false then error number -128 -- User canceled
	set chosen_theme to item 1 of the_selection 
	set this_slideshow to make new slideshow with data {theme:chosen_theme, slideSize:{theme_width, theme_height}}
end tell


