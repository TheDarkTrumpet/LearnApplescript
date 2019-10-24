tell application "Adobe InDesign CS4"
	tell document 1
		if exists (link 1 whose status is link missing) then
			set the_graphic to parent of link 1 whose status is link missing
			set the_graphics_frame to parent of the_graphic
			select the_graphics_frame
			-- The next line is a simple trick to scroll to the page if necessary, 
			-- and center the selection on screen
			set zoom percentage of layout window 1 to (get zoom percentage of layout window 1)
		end if
	end tell
end tell


