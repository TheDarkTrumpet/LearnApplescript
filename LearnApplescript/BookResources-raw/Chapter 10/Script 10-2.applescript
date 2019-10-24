tell application "Finder"
	set names_list to name of every folder of startup disk
end tell
if names_list contains "Applications" and Â
	names_list contains "Library" and Â
	names_list contains "System" and Â
	names_list contains "Users" then
	display dialog "Startup disk has all key folders"
else
	display dialog "Startup disk is missing some key folders"
end if