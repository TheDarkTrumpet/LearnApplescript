tell application "Address Book"
	activate
	set group_name to text returned of (display dialog "Enter name of new group:" default answer "")
	set new_group to make new group with properties {name:group_name}
	repeat with person_ref in (get selection)
		add person_ref to new_group
	end repeat
	save
	set selected of new_group to true
end tell
