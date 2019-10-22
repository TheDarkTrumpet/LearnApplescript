-- Execute Perl Script
-- Created by Christian Grunenberg on Thu Aug 05 2004.
-- Copyright (c) 2004-2019. All rights reserved.

on run
	tell application id "DNtp"
		try
			if exists content record then
				my executeSource(text of think window 1 as string, true)
			else if (count of selection) is 1 then
				my triggered(item 1 of (the selection as list), true)
			end if
		end try
	end tell
end run

on executeSource(this_source, displayError)
	tell application id "DNtp"
		try
			if this_source is not missing value and length of this_source > 0 then
				set tmpDir to POSIX path of (path to temporary items from user domain)
				set tmpDir to tmpDir & "/DEVONthink/_temp_.pl"
				set this_path to quoted form of tmpDir
				do shell script "echo " & quoted form of this_source & ">" & this_path
				do shell script "perl " & this_path
			end if
		on error error_message number error_number
			if displayError and error_number is not -128 then display alert "DEVONthink" message error_message as warning
		end try
	end tell
end executeSource

on triggered(theRecord)
	tell application id "DNtp"
		try
			my executeSource(plain text of theRecord, false)
		end try
	end tell
end triggered