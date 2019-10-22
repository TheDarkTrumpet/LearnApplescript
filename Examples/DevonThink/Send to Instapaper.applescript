-- Send to Instapaper
-- Written by Eric Böhnisch-Volkmann, Version 1.0, Aug 7, 2012
-- © 2012-2019 DEVONtechnologies, LLC


-- Constants
tell application id "DNtp"
	if version begins with "3." then
		set myPrefDomain to "com.devon-technologies.think3"
	else
		set myPrefDomain to "com.devon-technologies.thinkpro2"
	end if
	set myTitle to "Send to Instapaper"
end tell

-- Global variables
set username to ""
set passwd to ""

-- Simple urlencode function
on urlencode(input)
	return do shell script "php -r 'echo trim(urlencode(" & "\"" & input & "" & "\"));'"
end urlencode

-- Test if Option key is pressed
on isOptionKeyPressed()
	return (do shell script "/usr/bin/python -c 'import Cocoa; print Cocoa.NSEvent.modifierFlags() & Cocoa.NSAlternateKeyMask > 1'") is "True"
end isOptionKeyPressed

-- Read credentials from DEVONthink's defaults
-- If they're empty, let the user enter them
on getCredentials()
	try
		set my username to do shell script "defaults read " & my myPrefDomain & " InstapaperUsername"
		set my passwd to do shell script "defaults read " & my myPrefDomain & " InstapaperPassword"
	on error errnum
		set my username to ""
		set my passwd to ""
	end try
end getCredentials

-- Reset the stored Instapaper username and password
on resetCredentials()
	try
		do shell script "defaults delete " & myPrefDomain & " InstapaperUsername"
		do shell script "defaults delete " & myPrefDomain & " InstapaperPassword"
	end try
	set my username to ""
	set my passwd to ""
	display alert (localized string "Instapaper credentials reset") message (localized string "The saved Instapaper username and password have been deleted. Please re-enter your credentials to use this functionality.") as informational buttons {localized string "Cancel", localized string "Continue"} default button 2 cancel button 1
end resetCredentials

-- Check credentials for validity using Instapaper's API
on credentialsAreValid(username, passwd)
	if username is equal to "" or passwd is equal to "" then return false
	set instapaperURL to "https://www.instapaper.com/api/authenticate?username=" & username & "&password=" & passwd
	set returnValue to do shell script "curl --get '" & instapaperURL & "'"
	if returnValue is equal to "200" then return true
	return false
end credentialsAreValid

-- Let the user enter their Instapaper username and password
on askForCredentials()
	tell application id "DNtp" to set credentials to display authentication dialog (localized string "Please enter your Instapaper credentials.")
	set my username to user of the credentials
	set my passwd to |password| of the credentials
	do shell script "defaults write " & my myPrefDomain & " InstapaperUsername " & quoted form of my username
	do shell script "defaults write " & my myPrefDomain & " InstapaperPassword " & quoted form of my passwd
end askForCredentials

-- Sends the URLs of the items selected in DEVONthink to Instapaper
on sendDEVONthinkSelectionToInstapaper()
	-- Get URL of selected document(s)
	tell application id "DNtp" to set thisSelection to the selection
	if thisSelection is {} then
		error localized string "Please select at least one document, then try again."
	end if
	
	-- Add URLs to Instapaper
	tell application id "DNtp" to show progress indicator (localized string "Sending to Instapaper") steps (count of thisSelection) with cancel button
	repeat with aRecord in thisSelection
		tell application id "DNtp"
			if cancelled progress then exit repeat -- Check if the user clicked the cancel button
			set theURL to URL of aRecord
			set theTitle to name of aRecord
			if theURL is not equal to "" then
				step progress indicator theTitle
				my addToInstapaper(my username, my passwd, theURL, theTitle)
			end if
		end tell
	end repeat
	tell application id "DNtp" to hide progress indicator
end sendDEVONthinkSelectionToInstapaper

-- Add a URL to the user's Instapaper list
on addToInstapaper(username, passwd, theURL, theTitle)
	set instapaperURL to "https://www.instapaper.com/api/add?username=" & username & "&password=" & passwd & "&url=" & urlencode(theURL)
	if theTitle is not equal to "" then set instapaperURL to instapaperURL & "&title=" & urlencode(theTitle)
	set returnValue to do shell script "curl --get '" & instapaperURL & "'"
	if returnValue is equal to "200" then return true
	return false
end addToInstapaper


-- MAIN

if isOptionKeyPressed() then -- If the Option key was held, resent credentials; otherwise read them from the prefs
	resetCredentials()
else
	getCredentials()
end if
repeat while not credentialsAreValid(my username, my passwd) -- Ask for credentials
	askForCredentials()
end repeat
sendDEVONthinkSelectionToInstapaper() -- Send URLs of selected items to Instapaper