 on open {pdf_file}
	 set shell_script to "/usr/local/bin/pdffonts " & quoted form of POSIX path of pdf_file
	 try
		 set shell_result to do shell script shell_script
	 on error error_message
		 display dialog "Error:" & return & error_message
		 return
	 end try
	 -- The first 2 lines are table headings, so we ignore those
	 if (count paragraphs of shell_result) > 2 then
		 set font_info_list to paragraphs 3 thru -1 of shell_result
		 set embedded_font_count to 0
		 repeat with font_info_ref in font_info_list
			 -- The embedded column is fifth from the right
			 set is_embedded to word -5 of font_info_ref
			 if is_embedded is "yes" then
				 set embedded_font_count to embedded_font_count + 1
			 end if
		 end repeat
		 display dialog "This PDF contains " & (count font_info_list) & " fonts, out of which " & embedded_font_count & " are embedded."
	 else
		 display dialog "No fonts were found."
	 end if
 end open



