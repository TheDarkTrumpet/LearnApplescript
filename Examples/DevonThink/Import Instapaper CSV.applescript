-- Use Instapaper to export a CSV file of your articles.
-- Must have Numbers to open it in.
-- Will create PDF documents in /Instapaper/<your folder in Instapaper> groups.
-- Be sure to select an open database in DT Pro before you run this.
--
-- Created by Annard Brouwer, 24/08/2014
-- Share and enjoy!

property kCSVFileType : "csv"
property kRootGroupName : "Instapaper"

tell application "DEVONthink 3"
	local csvFile, csvDocument, cellRange, aRow, loadURL, theTitle, theGroup
	
	set downloadsFolder to path to downloads folder from user domain
	tell application id "DNtp"
		set csvFile to choose file with prompt "Select a csv file exported from Instapaper" of type kCSVFileType default location (downloadsFolder as alias)
	end tell
	
	set csvDocument to open csvFile
	
	tell csvDocument
		tell first «class NmSh»
			tell first «class NmTb»
				try
					set cellRange to «class NMTc»
					my windUp(count of every «class NMRw»)
					repeat with aRow in every «class NMRw»
						if «class NMad» of aRow > 1 then
							tell aRow
								set loadURL to the «class NMCv» of first «class NmCl»
								set theTitle to «class NMCv» of second «class NmCl»
								set theGroup to «class NMCv» of fourth «class NmCl»
								my importArticle(loadURL, theTitle, theGroup)
							end tell
						end if
					end repeat
					my windDown()
				on error errorMessage number errorNumber
					my windDown()
					if the errorNumber is not -128 then display alert "DEVONthink" message errorMessage as warning
				end try
			end tell
		end tell
	end tell
end tell

on windUp(numberOfArticles)
	tell application id "DNtp"
		activate
		show progress indicator "Archiving Instapaper articles..." steps numberOfArticles
	end tell
end windUp

on windDown()
	tell application id "DNtp"
		activate
		hide progress indicator
	end tell
end windDown

on importArticle(aURL, aTitle, aGroup)
	local groupPath, theGroup, theRecord
	
	tell application id "DNtp"
		try
			step progress indicator aTitle
			set groupPath to kRootGroupName & "/" & aGroup
			if not (exists record at groupPath) then
				set theGroup to create location groupPath
			else
				set theGroup to get record at groupPath
			end if
			set theRecord to create PDF document from aURL name aTitle in theGroup pagination no
		on error errorMessage
			log message aURL info errorMessage
		end try
	end tell
end importArticle
