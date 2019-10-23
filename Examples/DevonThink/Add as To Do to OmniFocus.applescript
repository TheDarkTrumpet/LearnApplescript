-- Script to add a selected record to OmniFocus as a to do
-- Written by Eric Böhnisch-Volkmann, Version 1.0.2, Aug 10, 2010
-- © 2010-2017 DEVONtechnologies, LLC
-- Modified March 29, 2017 by Jim Neumann / BLUEFROG / DEVONtechnologies, LLC
--> Added Custom Date option


-- Set properties
property pDaysIntoFuture : -1 -- Created to do will have a due date n days in the future
property pPrefix : "Reminder" -- Prefix for the created to do item
property pDelays : {{displayname:"No due date", value:-2}, {displayname:"Custom…", value:-1}, {displayname:"Tomorrow", value:1 * days}, {displayname:"In two days", value:2 * days}, {displayname:"In three days", value:3 * days}, {displayname:"In one week", value:1 * weeks}, {displayname:"In two weeks", value:2 * weeks}, {displayname:"In one month", value:4 * weeks}, {displayname:"In two months", value:8 * weeks}, {displayname:"In three months", value:90 * days}, {displayname:"In six months", value:180 * days}, {displayname:"In one year", value:365 * days}}
property pDefaultDelay : "In one week"

-- Import helper library
tell application "Finder" to set pathToAdditions to ((path to application id "DNtp" as string) & "Contents:Resources:Template Script Additions.scpt") as alias
set helperLibrary to load script pathToAdditions

try
	-- Get the selection
	tell application id "DNtp" to set thisSelection to the selection
	
	-- Error handling
	if thisSelection is {} then error localized string "Please select a document or group, then try again."
	if (length of thisSelection) > 1 then error localized string "Please select only one document or group, then try again."
	
	-- Get and format the data we need
	set pLocalizedPrefix to localized string pPrefix
	tell application id "DNtp"
		set thisItem to first item of thisSelection
		set theSummary to (pLocalizedPrefix & ": " & name of thisItem) as string
		set theURL to (reference URL of thisItem) as string
	end tell
	
	-- Let the user choose when to receive the reminder
	-- Convert array into localized arrays
	set pLocalizedDelays to {}
	set pLocalizedDelayNames to {}
	repeat with theDelay in pDelays
		set pLocalizedDelays to pLocalizedDelays & {{displayname:localized string (displayname of theDelay), value:(value of theDelay)}}
		set pLocalizedDelayNames to pLocalizedDelayNames & {localized string (displayname of theDelay)}
	end repeat
	set theChoice to choose from list pLocalizedDelayNames with title (localized string "Set reminder") with prompt (localized string "Please choose when you want to get reminded of the item") & " \"" & theSummary & "\"" & (localized string "%choice prompt end%") & ":" default items {pDefaultDelay}
	if theChoice is false then return false -- If the user pressed Cancel, exit
	set theDelayValue to pDaysIntoFuture -- Assume default
	try
		-- Find the number of days associated with the user's choice
		repeat with theDelay in pLocalizedDelays
			if ((displayname of theDelay) as string) is equal to (theChoice as string) then set theDelayValue to (value of theDelay)
		end repeat
	end try
	
	-- Calculate due date
	if theDelayValue ≥ 0 then set theDueDate to (date (date string of (current date))) + theDelayValue
	if theDelayValue = -1 then set theDueDate to (date (text returned of (display dialog (localized string "Enter the due date (e.g. 1/4/2017 22:45pm):") default answer "")))
	
	-- Add new to do to OmniFocus
	try
		tell application "OmniFocus"
			if (theDelayValue ≥ 0) or (theDelayValue = -1) then
				tell default document to set newTask to make new inbox task with properties {name:theSummary, due date:theDueDate, note:theURL}
			else if theDelayValue = -2 then
				tell default document to set newTask to make new inbox task with properties {name:theSummary, note:theURL}
			end if
		end tell
	on error errmsg
		display alert (localized string "OmniFocus is not available. You may need to update to OmniFocus Pro to use this script.")
	end try
	
on error errmsg
	
	display alert (localized string "Error when adding item to OmniFocus") message errmsg
	
end try