 tell application "Keynote"
	 set slideshow_content to "Presentation name: " & (name of slideshow 1) & space
	 tell slideshow 1
		 repeat with i from 1 to count slides
			 set slideshow_content to slideshow_content & (title of slide i) & space
			 set slideshow_content to slideshow_content & (body of slide i) & space
			 set slideshow_content to slideshow_content & (notes of slide i) & space
		 end repeat
	 end tell
 end tell
 set file_path to POSIX path of (choose file name with prompt "Save the presentation's content as:" default name "My Presentation.m4a")
 if file_path does not end with ".m4a" then set file_path to file_path & ".m4a"
 do shell script "say -o" & space & quoted form of file_path & space & quoted form of slideshow_content


