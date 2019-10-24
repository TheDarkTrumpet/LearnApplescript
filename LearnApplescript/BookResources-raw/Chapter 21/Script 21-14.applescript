tell application "Address Book"
	set new_person to make new person at end of people with properties {first name:"Janet", last name:"Brown", organization:"Brown & Black Inc."}
	make new phone at end of phones of new_person with properties 		  {label:"Mobile", value:"901-555-2124"}
	save -- Remember to save your changes!
end tell


