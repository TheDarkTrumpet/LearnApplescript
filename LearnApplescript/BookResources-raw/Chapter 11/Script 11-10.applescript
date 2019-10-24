 property template_file : missing value
 property title_font : missing value

 on run
	 if template_file is missing value or title_font is missing value then
		 set_preferences()
	 end if
	 display dialog "Run the script or change settings?" buttons {"Quit", "Settings", "Run"} default button "Run"
	 set button_pressed to button returned of result
	 if button_pressed is "Quit" then
		 return
	 else if button_pressed is "Settings" then
		set_preferences()
	 end if
	 -- The rest of your code is here...
 end run

 on set_preferences()
	 set template_file to choose file with prompt "Pick an Illustrator template"
	 tell application "Adobe Illustrator"
		 set fonts_list to name of every text font
	 end tell
	 set user_selection to choose from list fonts_list with prompt "Pick a font for the title"
	 if user_selection is false then error number -128 -- User canceled
	 set title_font to item 1 of user_selection
 end set_preferences


