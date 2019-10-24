set form_text to "Let it be known that [company] is responsible for any damage" & " any employee causes during [company]'s activity while in the conference."
set finished_form to find_and_replace(form_text, "[company]", "Disney Inc.")

on find_and_replace(the_text, search_text, replacement_text)
	set old_delims to text item delimiters
	set text item delimiters to search_text
	set temporary_list to text items of the_text
	set text item delimiters to replacement_text
	set finished_text to temporary_list as text
	set text item delimiters to old_delims
	return finished_text
end find_and_replace


