tell application "Mail"
	set the_message to item 1 of (get selection)
	{sender, subject, date sent, date received} of the_message
end tell


