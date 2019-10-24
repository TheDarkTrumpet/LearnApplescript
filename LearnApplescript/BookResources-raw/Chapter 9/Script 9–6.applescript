property folder_path : ""
property weeks_old : 0

-- Verify folder
tell application "Finder"
	set folder_exists to folder folder_path exists
end tell
if not folder_exists then
	set folder_path to choose folder with prompt "Pick a folder to clean:"
	set folder_path to folder_path as text
end if

-- Verify weeks
if weeks_old < 1 then
	set dialog_reply to display dialog "Delete files that are how many weeks old?" default answer "5"
	set weeks_old to (text returned of dialog_reply) as integer
end if

set expiration_date to (current date) - (weeks_old * weeks)
tell application "Finder" to set folder_name to name of folder folder_path
set short_date to short date string of expiration_date

display dialog "Files in folder \"" & folder_name & "\" that were created before " & short_date & " will be deleted."

tell application "Finder"
	tell (every file of folder folder_path whose creation date < expiration_date)
		set label index to 2
	end tell
end tell


