 tell application "Keynote"
	 activate
	 set the_selection to choose from list (get name of every appTransition)
	 if the_selection is false then error number -128 -- User canceled
	 set chosen_transition to item 1 of the_selection
	 tell slideshow 1
		 set appTransition of slideTransition of every slide to chosen_transition
	 end tell
 end tell


