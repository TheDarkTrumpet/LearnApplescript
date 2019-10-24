 tell application "AppleScript Editor"
	 compile document 1
	 set script_text to text of document 1
 end tell

 set line_number to 1
 set formatted_lines to {}
 set is_continuing_line to false
 repeat with line_ref in paragraphs of script_text
	 ignoring white space
		 if contents of line_ref = "" then -- Empty lines are blank
			 set end of formatted_lines to ""
		 else if is_continuing_line then -- Don't number continuing lines
			 set end of formatted_lines to "		" & line_ref
		 else -- Add a line number
			 set end of formatted_lines to (line_number as text) & ". " & line_ref
			 set line_number to line_number + 1
		 end if
		 set is_continuing_line to line_ref ends with "¬"
	 end ignoring
 end repeat
 set text item delimiters to {return}
 set formatted_text to formatted_lines as text

 tell application "Microsoft Word"
	 set content of selection to formatted_text
	 clear formatting selection
	 set style of paragraphs of selection to Word style "code" of active document
	 set style of first paragraph of selection to Word style "code first" of active document
	 set style of last paragraph of selection to Word style "code last" of active document
	 tell find object of selection
		 clear formatting
		 set content to tab
		 clear formatting of its replacement
		 set content of its replacement to "	"
		 execute find wrap find find continue replace replace all with match forward
	 end tell
 end tell


