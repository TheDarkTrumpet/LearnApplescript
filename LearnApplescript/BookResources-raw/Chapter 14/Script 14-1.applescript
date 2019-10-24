 set new_text to "Hello!"
 tell application "TextEdit"
	 if exists document 1 then
		 set text of document 1 to new_text
	 else
		 make new document with properties {text:new_text}
	 end if
 end tell


