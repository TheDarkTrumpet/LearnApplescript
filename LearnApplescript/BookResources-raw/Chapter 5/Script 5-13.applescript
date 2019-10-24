tell application "Address Book"
	get name of first person whose (email_address is in (value of every email))
end tell


