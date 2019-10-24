 tell application "Address Book"
	 tell every person of group "Work"
		 set the_names to name
		 set phones_by_name to value of every phone
	 end tell
 end tell

 set table_rows to {}
 repeat with i from 1 to length of the_names
	 set end of table_rows to item i of the_names & tab & item i of phones_by_name
 end repeat
 set AppleScript's text item delimiters to linefeed
 set table_text to table_rows as text


