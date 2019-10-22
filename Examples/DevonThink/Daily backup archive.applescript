-- Daily backup archive.
-- Created by Christian Grunenberg on Mon Jun 22 2009.
-- Copyright (c) 2009-2019. All rights reserved.

tell application id "DNtp"
	try
		if not (exists current database) then error "No database is open."
		set this_database to current database
		
		set this_date to do shell script "date +%y-%m-%d"
		
		set this_path to path of this_database
		set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, "/"}
		set this_name to the last text item of this_path
		set AppleScript's text item delimiters to ""
		if this_name ends with ".dtBase2" then set this_name to (characters 1 thru -9 of this_name) as string
		set this_archive to "~/Backup/" & this_name & " " & this_date & ".dtBase2.zip"
		set AppleScript's text item delimiters to od
		
		show progress indicator "Daily Backup Archive" steps 3
		
		with timeout of 1200 seconds
			step progress indicator "Verifying..."
			if (verify database this_database) is not 0 then error "Database is damaged."
			
			step progress indicator "Optimizing..."
			if not (optimize database this_database) then error "Optimization of database failed."
			
			step progress indicator "Zipping..."
			if not (compress database this_database to this_archive) then error "Backup failed."
		end timeout
		
		hide progress indicator
	on error error_message number error_number
		hide progress indicator
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell