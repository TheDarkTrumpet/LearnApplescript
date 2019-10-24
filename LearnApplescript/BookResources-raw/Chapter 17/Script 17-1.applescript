 property the_alias : missing value
 property last_pathname : ""

 if the_alias is missing value then
	 set the_alias to choose file
 else
	 set this_pathname to the_alias as text
	 if this_pathname = last_pathname then
		 display dialog "The file hasn't moved"
	 else
		 display dialog "Old file path:" & return & last_pathname & return & "New location: " & return & this_pathname
	 end if
 end if
 set last_pathname to the_alias as text


