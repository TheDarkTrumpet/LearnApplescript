 on trim_tabs_and_spaces(the_text)
	 considering hyphens, punctuation and white space
		 repeat while the_text starts with space or the_text starts with tab
			 if length of the_text is 1 then
				 set the_text to ""
			 else
				 set the_text to text 2 thru -1 of the_text
			 end if
		 end repeat
		 repeat while the_text ends with space or the_text ends with tab
			 set the_text to text 1 thru -2 of the_text
		 end repeat
		 return the_text
	end considering
 end trim_tabs_and_spaces


