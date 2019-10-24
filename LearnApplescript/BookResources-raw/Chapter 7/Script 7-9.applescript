 set form_text to "Let it be known that [company] is responsible for any damage" & " any employee causes during [company]'s activity while in the conference."

 set text item delimiters to "[company]"
 set temporary_list to text items of form_text
 set text item delimiters to "Disney Inc."
 set finished_form to temporary_list as text
 set text item delimiters to ""
 return finished_form


