-- Open DEVONthink record for current PDF Expert tab

-- solution for umlauts ("iconv -t UTF8-MAC") found here: https://stackoverflow.com/questions/23219482/bash-ps-grep-for-process-with-umlaut-os-x/23226449#23226449

tell application "System Events"
	try
		tell application process "PDF Expert"
			tell window 1
				set theFileName to value of attribute "AXTitle" & ".pdf"
				if theFileName starts with "* " then set theFileName to characters 3 thru -1 in theFileName as string
			end tell
			set PID to unix id
		end tell
	on error error_message number error_number
		if the error_number is not -128 then
			display alert "System Events" & space & error_number message error_message as warning
			return
		end if
	end try
end tell

set theOpenFiles to (do shell script "lsof -p " & PID)

set convertedOutput to (do shell script "iconv -t UTF8-MAC <<<$" & quoted form of theOpenFiles)

set theLines to paragraphs of convertedOutput

repeat with thisLine in theLines
	if thisLine contains theFileName then
		set thePath to characters (offset of "/" in thisLine) thru -1 in thisLine as string
		exit repeat
	end if
end repeat

tell application id "DNtp"
	try
		set theDatabases to databases
		set theResults to {}
		repeat with thisDatabase in theDatabases
			set thisDatabasesResults to lookup records with path thePath in thisDatabase
			set theResults to theResults & thisDatabasesResults
		end repeat
		if theResults = {} then
			display notification "Pfad nicht in offenen Datenbanken enthalten!" with title "Lookup DEVONthink"
			return
		else
			open window for record (item 1 of theResults)
			activate
		end if
		
	on error error_message number error_number
		if the error_number is not -128 then
			display alert "DEVONthink Pro" & space & error_number message error_message as warning
			return
		end if
	end try
end tell