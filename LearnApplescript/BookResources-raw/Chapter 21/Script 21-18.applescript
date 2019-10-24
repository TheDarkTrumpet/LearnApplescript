 -- Ask user to select a letter from A to Z
 set character_list to characters of "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 set the_selection to choose from list character_list
 if the_selection is false then return -- User canceled
 set chosen_character to item 1 of the_selection

 -- Get the names of people whose first/last names start with that letter
 tell application "Address Book"
	 set name_list to name of every person whose first name starts with chosen_character or last name starts with chosen_character
 end tell
 if name_list is {} then
	 display alert "No matching people were found." as warning
	 return
 end if

 -- Ask user to select a person's name
 set the_selection to choose from list name_list
 if the_selection is false then return -- User canceled
 set chosen_name to item 1 of the_selection

 -- Get all the email and phone contact info for the chosen person
 tell application "Address Book"
	 set chosen_person to first person whose name is chosen_name
	 tell chosen_person
		 set {email_labels, email_values} to {label, value} of every email
		 set {phone_labels, phone_values} to {label, value} of every phone
	 end tell
 end tell
 if email_labels is {} and phone_labels is {} then
	 display alert "The person you selected has no email or phone details." as warning
	 return
 end if

 -- Assemble a string containing the contact information
 set the_message to "Contact information for " & chosen_name & ":" & return
 repeat with i from 1 to (count email_labels)
	 set the_label to item i of email_labels
	 set the_value to item i of email_values
	 set the_message to the_message & the_label & " email: " & the_value & return
 end repeat
 repeat with i from 1 to (count phone_labels)
	 set the_label to item i of phone_labels
	 set the_value to item i of phone_values
	 set the_message to the_message & the_label & " number: " & the_value & return
 end repeat

 -- Display the contact information, with the option of creating a new email
 if email_labels is {} then
	 display alert the_message
 else
	 set dialog_reply to display alert the_message buttons {"Make E-mail", "OK"}
	 if button returned of dialog_reply is "Make E-mail" then
		 tell application "Mail"
			 activate
			 set new_message to make new outgoing message with properties {visible:true}
			 tell new_message to make new to recipient with properties {name:chosen_name, address:item 1 of email_values}
		 end tell
	 end if
 end if


