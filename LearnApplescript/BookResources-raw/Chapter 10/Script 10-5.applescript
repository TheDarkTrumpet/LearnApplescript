-- Get a list of words from the front TextEdit document
tell application "TextEdit"
	set word_list to every word of document 1
end tell
-- Define a list to store the number of times each word appears.
-- Each item in the list will be a record with the following structure:
-- {the_word:<text>, the_count:<integer>}
set word_frequency_list to {}

-- Loop through the words in the master list
repeat with the_word_ref in word_list
	-- Extract the word string from the reference and assign it to a variable
	set the_current_word to contents of the_word_ref
	-- See if the word frequency list already has an entry for this word
	set word_info to missing value
	repeat with record_ref in word_frequency_list
		if the_word of record_ref = the_current_word then
			-- Assign the record to word_info, then end the search
			set word_info to contents of record_ref
			exit repeat
		end if
	end repeat
	-- Check to see if we found an existing entry for the current word
	if word_info = missing value then
		-- No matching record was found, so create a new one
		set word_info to {the_word:the_current_word, the_count:1}
		set end of word_frequency_list to word_info
	else
		-- Increment the word count
		set the_count of word_info to (the_count of word_info) + 1
	end if
end repeat

-- Build the report
set the_report_list to {}
repeat with word_info in word_frequency_list
	set end of the_report_list to quote & the_word of word_info & quote & " appears " & the_count of word_info & " times."
end repeat

-- Coerce the list into a single return-delimited string
set AppleScript's text item delimiters to return
set the_report to the_report_list as text

-- Create a new TextEdit document containing the finished report
tell application "TextEdit"
	make new document with properties {name:"Word Frequencies", text:the_report}
end tell
