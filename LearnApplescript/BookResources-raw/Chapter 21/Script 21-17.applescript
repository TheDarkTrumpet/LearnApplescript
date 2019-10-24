using terms from application "Address Book"
	on action property
		return "phone"
	end action property
	
	on action title for thePerson with theEntry
		return "Add to Phone List"
	end action title
	
	on should enable action with the_element for the_person
		return true
	end should enable action
	
	on perform action with the_element for the_person
		set person_name to name of the_person
		set phone_number to value of the_element
		tell application "TextEdit"
			if not (exists document "Phone List") then
				make new document with properties {name:"Phone List"}
			end if
			make new paragraph at (end of paragraphs of document "Phone List") with data (person_name & tab & phone_number & linefeed)
		end tell
	end perform action
end using terms from


