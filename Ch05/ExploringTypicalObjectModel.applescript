on toString(anyObj)
	local i, txt, errMsg, orgTids, oName, oId, prefix
	set txt to ""
	repeat with i from 1 to 2
		try
			if i is 1 then
				if class of anyObj is list then
					set {orgTids, AppleScript's text item delimiters} to {AppleScript's text item delimiters, {", "}}
					set txt to ("{" & anyObj as string) & "}"
					set AppleScript's text item delimiters to orgTids # '
				else
					set txt to anyObj as string
				end if
			else
				set txt to properties of anyObj as string
			end if
		on error errMsg
			# Trick for records and record-*like* objects:
			# We exploit the fact that the error message contains the desired string representation of the record, so we extract it from there. This (still) works as of AS 2.3 (OS X 10.9).
			try
				set txt to do shell script "egrep -o '\\{.*\\}' <<< " & quoted form of errMsg
			end try
		end try
		if txt is not "" then exit repeat
	end repeat
	set prefix to ""
	if class of anyObj is not in {text, integer, real, boolean, date, list, record} and anyObj is not missing value then
		set prefix to "[" & class of anyObj
		set oName to ""
		set oId to ""
		try
			set oName to name of anyObj
			if oName is not missing value then set prefix to prefix & " name=\"" & oName & "\""
		end try
		try
			set oId to id of anyObj
			if oId is not missing value then set prefix to prefix & " id=" & oId
		end try
		set prefix to prefix & "] "
	end if
	return prefix & txt
end toString

on dlog(anyObjOrListOfObjects)
	global DLOG_TARGETS
	try
		if length of DLOG_TARGETS is 0 then return
	on error
		return
	end try
	# The following tries hard to derive a readable representation from the input object(s).
	if class of anyObjOrListOfObjects is not list then set anyObjOrListOfObjects to {anyObjOrListOfObjects}
	local lst, i, txt, errMsg, orgTids, oName, oId, prefix, logTarget, txtCombined, prefixTime, prefixDateTime
	set lst to {}
	repeat with anyObj in anyObjOrListOfObjects
		set txt to ""
		repeat with i from 1 to 2
			try
				if i is 1 then
					if class of anyObj is list then
						set {orgTids, AppleScript's text item delimiters} to {AppleScript's text item delimiters, {", "}} # '
						set txt to ("{" & anyObj as string) & "}"
						set AppleScript's text item delimiters to orgTids # '
					else
						set txt to anyObj as string
					end if
				else
					set txt to properties of anyObj as string
				end if
			on error errMsg
				# Trick for records and record-*like* objects:
				# We exploit the fact that the error message contains the desired string representation of the record, so we extract it from there. This (still) works as of AS 2.3 (OS X 10.9).
				try
					set txt to do shell script "egrep -o '\\{.*\\}' <<< " & quoted form of errMsg
				end try
			end try
			if txt is not "" then exit repeat
		end repeat
		set prefix to ""
		if class of anyObj is not in {text, integer, real, boolean, date, list, record} and anyObj is not missing value then
			set prefix to "[" & class of anyObj
			set oName to ""
			set oId to ""
			try
				set oName to name of anyObj
				if oName is not missing value then set prefix to prefix & " name=\"" & oName & "\""
			end try
			try
				set oId to id of anyObj
				if oId is not missing value then set prefix to prefix & " id=" & oId
			end try
			set prefix to prefix & "] "
			set txt to prefix & txt
		end if
		set lst to lst & txt
	end repeat
	set {orgTids, AppleScript's text item delimiters} to {AppleScript's text item delimiters, {" "}} # '
	set txtCombined to lst as string
	set prefixTime to "[" & time string of (current date) & "] "
	set prefixDateTime to "[" & short date string of (current date) & " " & text 2 thru -1 of prefixTime
	set AppleScript's text item delimiters to orgTids # '
	# Log the result to every target specified.
	repeat with logTarget in DLOG_TARGETS
		if contents of logTarget is "log" then
			log prefixTime & txtCombined
		else if contents of logTarget is "alert" then
			display alert prefixTime & txtCombined
		else if contents of logTarget is "syslog" then
			do shell script "logger -t " & quoted form of ("AS: " & (name of me)) & " " & quoted form of txtCombined
		else # assumed to be a POSIX file path to *append* to.
			set fpath to contents of logTarget
			if fpath starts with "~/" then set fpath to "$HOME/" & text 3 thru -1 of fpath
			do shell script "printf '%s\\n' " & quoted form of (prefixDateTime & txtCombined) & " >> \"" & fpath & "\""
		end if
	end repeat
end dlog

on getAllDisks()
	tell application "Finder"
		set d to get every disk
		set aas to disk "Macintosh HD"
	end tell
	
	log "Disks: " & toString(d)
	log "Alias: " & aas
	d
end getAllDisks

on getHomeFolders()
	tell application "Finder"
		set dthole to folder "dthole" of folder "Users" of disk "Macintosh HD"
		set dthole_folders to folders of dthole
	end tell
	
	log "Dthole (Object): " & toString(dthole)
	dthole_folders
end getHomeFolders

-- Main Calls
set all_disks to getAllDisks()
set dthole_folders to getHomeFolders()
