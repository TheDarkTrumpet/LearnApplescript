 -- Use GUI Scripting to click on Edit -> Copy in Preview's menu bar
 tell application "Preview" to activate
 tell application "System Events"
	 tell application process "Preview"
		 click menu item "Copy" of menu "Edit" of menu bar item "Edit" of menu bar 1
	 end tell
 end tell

 -- Get the PDF data from the clipboard
 delay 1
 activate
 try
	 set pdf_data to the clipboard as «class PDF »
 on error number -1700 -- The clipboard doesn't contain any PDF data
	 display alert "Please make a marquee selection " & "in a PDF document in Preview, then try again." as warning
	 return
 end try

 -- Write the PDF data to file
 set destination_file to choose file name default name "cutting.pdf"
 set file_ID to open for access destination_file with write permission
 set eof file_ID to 0
 write pdf_data to file_ID as «class PDF »
 close access file_ID
 tell application "Finder"
	 set file type of file destination_file to "PDF "
 end tell

 -- Preview the new file
 tell application "Preview" to open destination_file


