set the_finds to {space & space, return & space, return & return}
set the_changes to {space, return, return}

tell application "Adobe InDesign CS4"
	-- Make sure InDesign can display dialogs
	set user interaction level of script preferences to interact with all
	
	-- Check that only one item is selected
	set selections_list to selection
	if length of selections_list ≠ 1 then
		display dialog "Please select some text or a text frame." buttons {"Cancel"}
		error number -128
	end if
	set the_selection to item 1 of selections_list
	
	-- If an insertion point or character is selected then get its containing story;
	-- if it's a text frame then get its parent story; otherwise check that it's 
	-- some other type of text 
	set item_class to class of the_selection
	if item_class is in {insertion point, character} then
		set the_selection to parent of the_selection
	else if item_class is text frame then
		set the_selection to parent story of the_selection
	else if item_class is not in {word, line, paragraph, text column, text style range, text} then
		display dialog "Please select some text or a text frame." buttons {"Cancel"}
		error number -128
	end if
	
	-- If we get this far then all is well, so do the actual work...
	
	-- Set the find-change options
	set find text preferences to nothing
	set change text preferences to nothing
	set properties of find change object options to {case sensitive:true, include footnotes:false, include hidden layers:false, include master pages:true, whole word:false}
	
	-- Perform the changes
	repeat with i from 1 to count the_finds
		set find what of find text preferences to (item i of the_finds)
		set change to of change text preferences to (item i of the_changes)
		change text the_selection
	end repeat
end tell


