on open list_of_aliases
	set the_alias to item 1 of list_of_aliases
	tell application "System Events"
		set item_type to type identifier of the_alias
	end tell
	display alert "You dropped a file of type \"" & item_type & "\""
end open

on run
	display alert "Drop something on me and I'll tell you what type it is!"
end run


