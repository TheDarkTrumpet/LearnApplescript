repeat with thisDatabase in allDatabases
		set t_fnd to (contents of thisDatabase whose name is i_fileName)
		set for_ to for_ & "In: " & name of thisDatabase & return
		set locList to ""
		if t_fnd is not equal to {} then
			repeat with thisItem in t_fnd
				set locList to locList & location of thisItem & name of thisItem & return & return
			end repeat
		else
			set locList to "Nothing found" & return & return
		end if
		set for_ to for_ & locList
end repeat