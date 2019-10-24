on make_temp_file()
	return do shell script "mktemp -t dss"
end make_temp_file

to write_UTF8_file(the_file, the_text)
	set file_ID to open for access the_file with write permission
	set eof file_ID to 0
	write the_text to file_ID as «class utf8»
	close access file_ID
end write_UTF8_file


set the_list to {"hello", "bob42", "three", "0.197"}
set pattern_to_match to "[[:digit:]]"

set temp_path to make_temp_file()
set input_text to join_lines(the_list)
write_UTF8_file(POSIX file temp_path, input_text)

do shell script "grep " & quoted form of pattern_to_match & " < " & quoted form of temp_path
every paragraph of result
--> {"bob42", "0.197"}


