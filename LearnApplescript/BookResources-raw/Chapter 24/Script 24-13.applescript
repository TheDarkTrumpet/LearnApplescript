 tell application "Microsoft Entourage"
	 set empty_address to {city:"", country:"", state:"", street address:"", zip:""}
	 set misfiled_contacts to every contact whose home address is not empty_address and business address is empty_address and default postal address is work
	 repeat with this_contact in misfiled_contacts
		 set default postal address of this_contact to home
	 end repeat
 end tell


