set the_file to alias ((path to documents folder as text) & "work.txt")
open for access the_file
try
	repeat
		set the_text to read the_file for 4
		display dialog the_text
	end repeat
on error number -39 -- Handle the end-of-file error
	close access the_file -- Close the file now that we’re finished with it
end try
display dialog "All done!"


