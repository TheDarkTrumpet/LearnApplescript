﻿ tell application "Microsoft Entourage"
	 -- Check selection
	 try
		 set the_selection to selection
	 on error
		 -- No sensible selection at all!
		 display dialog "Please select a folder and run the script again" buttons {"Abort"} 
		 return
	 end try

	 set the_folder to missing value
	 if class of the_selection is in {folder, news group} then
		 -- Folder selected - use this folder
		 set the_folder to the_selection
	 else
		 -- Something else selected - find out what
		 try
			 set the_messages to current messages
			 if (count the_messages) = 1 then
				 -- Just one message - could be in list or open in its own window
				 -- Use the folder that contains this message
				 set the_folder to storage of item 1 of the_messages
			 end if
		 on error
			 -- Nothing useable selected - abort run
			 display dialog "Please select a folder and run the script again" buttons {"Abort"} default button 1 with icon stop
			 return
		 end try
	 end if

	 -- Start processing
	 if the_folder ≠ missing value then
		 -- A folder was selected - get the data directly
		 set folder_name to name of the_folder
		 -- List of email addresses
		 set sender_list to (address of sender of every message of the_folder)
		 -- List of display names
		 set name_list to (display name of sender of every message of the_folder)
	 else
		 -- Multiple messages were selected - loop though to get the data
		 set folder_name to "Selected Messages"
		 set sender_list to {} -- List of email addresses
		 set name_list to {} -- List of display names
		 repeat with this_message in the_messages
			 set end of sender_list to address of sender of this_message
			 set end of name_list to display name of sender of this_message
		 end repeat
	 end if
 end tell

 -- Write the data out to a file
 -- (Temporary items folder will be emptied on next restart)
 set the_file to ((get path to temporary items folder) as text) & "SenderScript"
 set data_file to open for access the_file with write permission
 set eof data_file to 0
 set AppleScript's text item delimiters to {linefeed}
 set sender_text to sender_list as text 
 write sender_text to data_file as «class utf8»
 close access data_file

 -- Use shell script to sort and count unique email addresses...
 set the_script to "sort -f " & quoted form of (POSIX path of the_file) & " | tr '[:upper:]' '[:lower:]' | uniq -c"
 set frequency_info to paragraphs of (do shell script the_script)

 -- ...and parse the result
 set result_list to {{"Display Name", "Email Address", "Message Count"}}
 repeat with this_item in frequency_info
	  set message_count to word 1 of this_item
	 set email_address to (text 6 thru -1 of this_item)
	 -- Loop through list of email addresses to find this one...
	 repeat with i from 1 to (count sender_list)
		 if item i of sender_list is email_address then
			 -- ...and get the display name from the list of display names
			 set display_name to item i of name_list
			 exit repeat
		 end if
	 end repeat
	 if display_name = "" then set display_name to contents of email_address
	 set end of result_list to {display_name, email_address, message_count}
 end repeat

 tell application "Microsoft Excel"
	 activate
	 make new workbook
	 set the view of window 1 to normal view
	 set the display page breaks of the active sheet to false
	 set name of active sheet to "Count Senders"
	 set the_rows to count result_list
	 set the_columns to count (item 1 of result_list)
	 set the_range to get resize (range "a1" of active sheet of active workbook) row size the_rows column size the_columns
	 set value of the_range to result_list
	 set bold of font object of row 1 to true
	 sort the_range key1 (column 3 of the_range) order1 sort descending header header yes
	 autofit (columns of the_range)
	 if (count result_list) > 25 then
		 select sheet "Count Senders"
		 select (get intersect range1 the_range range2 range "$c:$c")
		 make new chart sheet at active workbook
		 set properties of active chart to {chart type:column clustered, has legend:false, has data table:false, name:"All Senders Chart"}
		 set name of series 1 of active chart to " All Senders of \"" & folder_name & "\""
		 select sheet "Count Senders"
		 select (get intersect range1 the_range range2 range "$A$1:$a$25,$c$1:$c$25")
		 make new chart sheet at active workbook
		 set properties of active chart to {chart type:column clustered, has legend:false, has data table:false, name:"Top 25 Chart"}
		 set name of series 1 of active chart to " Top 25 Senders of \"" & folder_name & "\""
	 else
		 select sheet "Count Senders"
		 select (get intersect range1 the_range range2 range "$a:$a,$c:$c")
		 make new chart sheet at active workbook
		 set properties of active chart to {chart type:column clustered, has legend:false, has data table:false, name:"All Senders Chart"}
		 set name of series 1 of active chart to " All Senders of \"" & folder_name & "\""
	 end if
 end tell


