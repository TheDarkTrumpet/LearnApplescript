 set the_file_name to "test data.txt"
 set the_file to alias ((path to desktop as text) & the_file_name)
 tell application "Microsoft Entourage"
	 set new_message to make new outgoing message at folder id 2 with properties {subject:"Here is the file you requested", content:"Please find attached the file " & the_file_name, attachment:{the_file}, recipient:{"Fred Flintstone <ff@hardrock.com.invalid>", {display name:"Mickey", address:"mmouse@disney.com.invalid"}, {recipient type:cc recipient, address:{display name:"Shrek", address:"shrek@dreamworks.com.invalid"}}}}
 end tell


