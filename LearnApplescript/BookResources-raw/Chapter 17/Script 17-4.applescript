set the_file to alias ((path to documents folder as text) & "work.txt")
open for access the_file
repeat
	set the_text to read the_file for 4
	display dialog the_text
end repeat


