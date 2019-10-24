 set the_file_name to "test data.txt"
 set the_file to alias ((path to desktop as text) & the_file_name)
 tell application "Microsoft Entourage"
	 set new_message to make new outgoing message at folder id 2
	 set subject of new_message to "Here is the file you requested"
	 set content of new_message to "Please find attached the file " & the_file_name
	 make new attachment at end of new_message with properties {file:the_file}
	 make new recipient at end of new_message with properties {recipient type:to recipient, address:{display name:"Fred Flintstone", address:"ff@hardrock.com.invalid"}}
	 make new recipient at end of new_message with properties {recipient type:to recipient, address:{display name:"Mickey", address:"mmouse@disney.com.invalid"}}
	 make new recipient at end of new_message with properties {recipient type:cc recipient, address:{display name:"Shrek", address:"shrek@dreamworks.com.invalid"}}
 end tell


