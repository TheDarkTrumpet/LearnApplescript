-- Man Page
-- Created by Christian Grunenberg on Sat Apr 16 2005.
-- Copyright (c) 2005-2019. All rights reserved.

-- Edited by Houthakker 2011 Feb 12 to import PDF (rather than text) version of man page
-- (to preserve highlighting of keywords and headers)

tell application id "DNtp"
	try
		repeat
			set page to display name editor "Man page" info "Enter the man page to import:"
			if page is not "" then exit repeat
		end repeat
		
		show progress indicator "Converting man page to PDF ..." steps -1
		set strPDF to "~/" & page & ".pdf"
		set strCmd to "man -t " & (quoted form of page) & " | pstopdf -i -o " & strPDF
		do shell script strCmd
		
		tell application id "com.apple.finder"
			set strTmpPath to (((path to home folder) as text) & page & ".pdf")
			set blnExists to exists strTmpPath
		end tell
		
		if blnExists then
			import strPDF name page to current group
			tell application id "com.apple.finder" to delete file strTmpPath
		else
			error "Page does not exist."
		end if
		hide progress indicator
	on error error_message number error_number
		hide progress indicator
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell