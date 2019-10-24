tell application "Adobe InDesign CS4"
	-- The next line ensures that InDesign can show our dialogs
	set user interaction level of script preferences to interact with all
	tell document 1
		set the_selection to selection -- Returns a list
		set the_graphic to item 1 of the_selection
		if class of the_graphic is in {EPS, image, imported page, PDF, PICT, WMF} then
			set the_graphics_link to item link of the_graphic
			set path_to_graphic to file path of the_graphics_link
			display dialog "The path to the selected graphic is: " & path_to_graphic buttons {"OK"}
		else
			display dialog "You don't have a graphic selected." buttons {"Cancel"}
		end if
	end tell
end tell


