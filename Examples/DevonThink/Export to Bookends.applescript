-- Export to Bookends
-- 1. Deconsolidates the item to Bookends' attachment
-- 2. Creates a new reference including name, comment, URL, author, keywords/tags, creation year, DOI, PMID, ISBN, publisher, journal, volume & pages
-- Updated for DEVONthink 3 by Christian Grunenberg on Fri May 31 2019.
-- Copyright (c) 2015-2019. All rights reserved.

tell application id "DNtp"
	try
		set theSelection to the selection
		repeat with theRecord in theSelection
			set theType to type of theRecord
			if theType is not group and theType is not smart group and theType is not feed then
				set thePath to path of theRecord
				if thePath is not "" and thePath does not contain "/Documents/Bookends/Attachments" then
					set theName to name of theRecord
					set theURL to URL of theRecord
					set theNote to comment of theRecord
					set theDate to creation date of theRecord
					set theYear to (year of theDate) as string
					
					set theMD to meta data of theRecord
					set theCustomMD to custom meta data of theRecord
					set {theAuthors, theKeywords, theDOI, thePMID, theISBN, thePublisher, theJournal, theVolume, thePages} to {"", "", "", "", "", "", "", "", ""}
					
					try
						set theAuthors to my metaDataItems(|kMDItemAuthors| of theMD)
						set theKeywords to my metaDataItems(|kMDItemKeywords| of theMD)
					end try
					
					if theKeywords is "" then
						set theKeywords to tags of theRecord
						set theKeywords to (theKeywords as string)
					end if
					
					try
						set theDOI to mddoi of theCustomMD
					end try
					try
						set thePMID to mdpmid of theCustomMD
					end try
					try
						set thePublisher to mdpublisher of theCustomMD
					end try
					try
						set theJournal to mdjournal of theCustomMD
					end try
					try
						set theVolume to mdvolume of theCustomMD
					end try
					try
						set thePages to mdpage of theCustomMD
					end try
					
					deconsolidate record theRecord to "~/Documents/Bookends/Attachments"
					
					set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, "/"}
					set theFilename to text item -1 of (path of theRecord as string)
					set AppleScript's text item delimiters to od
					
					tell application "Bookends"
						tell front library window to make new publication item with properties {title:theName, url:theURL, notes:theNote, keywords:theKeywords, authors:theAuthors, pmid:thePMID, doi:theDOI, isbn:theISBN, publication date string:theYear, publisher:thePublisher, journal:theJournal, volume:theVolume, pages:thePages, attachments:theFilename}
					end tell
				end if
			end if
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink Pro" message error_message as warning
	end try
end tell

on metaDataItems(theString)
	try
		if theString is not missing value and theString is not "" then
			local od, theItems
			set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, "," & (ASCII character 10)}
			set theItems to text items of theString
			set AppleScript's text item delimiters to ASCII character 10
			set theString to (theItems as string)
			set AppleScript's text item delimiters to od
			return theString
		end if
	end try
	return ""
end metaDataItems
