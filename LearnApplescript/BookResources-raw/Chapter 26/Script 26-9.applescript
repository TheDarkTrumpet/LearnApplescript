-- This property should contain the path to our template
property template_path : "Macintosh HD:Users:sstanley:Documents:Template.indd"

on open file_list
	set desktop_path to path to desktop as text
	tell application "Adobe InDesign CS4"
		-- Turn off interaction for the duration; we don't want 'missing font' 
		-- dialogs and the like
		set user interaction level of script preferences to never interact
		
		repeat with i from 1 to count file_list
			set the_document to open file template_path
			tell the_document
				-- Place the text from the file into the "Body" text frame
				place item i of file_list on text frame "Body"
				
				-- Move the first three lines into the "Head", "Byline", and "Intro" 
				-- text frames, deleting the trailing returns
				move paragraph 1 of parent story of text frame "Body" to after parent story of text frame "Head"
				delete character -1 of parent story of text frame "Head"
				move paragraph 1 of parent story of text frame "Body" to after parent story of text frame "Byline"
				delete character -1 of parent story of text frame "Byline"
				move paragraph 1 of parent story of text frame "Body" to after parent story of text frame "Intro"
				delete character -1 of parent story of text frame "Intro"
				
				-- Apply the various styles and do whatever else is required here...
				
				-- Save the document to the Desktop and close it when done
				save to file (desktop_path & "Finished file " & i & ".indd")
				close saving no
			end tell
		end repeat
		
		-- Turn interaction back on again
		set user interaction level of script preferences to interact with all
		
		-- With longer scripts it's a good idea to let the user know when you are done
		activate
		beep
		with timeout of 10000 seconds -- In case the user has gone to make a coffee
			display dialog "Done, " & (count file_list) & " files processed." buttons {"OK"} default button 1
		end timeout
	end tell
end open


