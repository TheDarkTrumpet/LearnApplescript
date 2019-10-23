on getProgrammingDatabase()
	tell application "DEVONthink 3"
		get 1st database whose name = "Programming"
	end tell
end getProgrammingDatabase

on getTopLevelFolders(db)
	tell application "DEVONthink 3"
		get every record of db whose location = "/" and kind = "Group"
	end tell
end getTopLevelFolders

on getDataForTestDocument(folderEnum)
	tell application "DEVONthink 3"
		try
			get plain text of 1st item of (get children of folderEnum whose kind = "PDF+Text")
		on error
			return ""
		end try
	end tell
end getDataForTestDocument

set progDatabase to getProgrammingDatabase()
set topLevelFolders to getTopLevelFolders(progDatabase)
set numTopLevelFolders to (length of topLevelFolders)
log "Length of topLevelFolders is: " & numTopLevelFolders
set randTopLevelFolder to (random number from 1 to numTopLevelFolders)
set chosenTopLevelFolder to item randTopLevelFolder of topLevelFolders
set chosenDocument to getDataForTestDocument(chosenTopLevelFolder)
