to trim_characters of the_text given from_front:f, from_back:b, trimming_spaces:s, trimming_tabs:t
	-- Assemble a list of characters to trim
	set characters_to_trim to {}
	if s then set end of characters_to_trim to space
	if t then set end of characters_to_trim to tab
	-- Trim from the start of the text
	if f then
		repeat while character 1 of the_text is in characters_to_trim
			if length of the_text is 1 then
				return ""
			else
				set the_text to text 2 thru -1 of the_text
			end if
		end repeat
	end if
	-- Trim from the end of the text
	if b then
		repeat while character -1 of the_text is in characters_to_trim
			if length of the_text is 1 then
				return ""
			else
				set the_text to text 1 thru -2 of the_text
			end if
		end repeat
	end if
	return the_text
end trim_characters


