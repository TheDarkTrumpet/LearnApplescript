use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "DEVONthink 3"
	set allDatabases to every database
	get 1st database whose name = "Programming"
	set pro to 1st database whose name = "Programming"
	--set appScript to every document whose path = "/Programming/Applescript"
	-- WORKS BUT ERROR: set appScript to lookup records with path "/Applescript/" in database pro
	--set appScript to 1st record whose location = "/Applescript/"
	set trashByName to get 1st record of pro whose name = "Trash"
	set trashBylocation to get 1st record of pro whose location = "/"
	-- set bootstrapBylocation to get 1st record of pro whose location = "/Bootstrap/"
	set theGroup to get record at "/Bootstrap"
	-- set theGroup to get record with location = "/" in database theDatabase
	set bootstrapGroup to get record at "/Bootstrap" in (database named "Programming")
	set bootstrapChildren to get children of bootstrapGroup
	set bootstrapChildren2 to get children of (get record at "/Bootstrap" in (database named "Programming"))
	-- set loc to get location of '/Applescript' in the "Programming" database
	-- loc
end tell