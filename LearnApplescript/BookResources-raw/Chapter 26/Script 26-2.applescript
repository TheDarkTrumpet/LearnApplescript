tell application "Adobe InDesign CS4"
	make new document
	tell document 1
		tell view preferences
			set horizontal measurement units to inches
			set vertical measurement units to inches
		end tell
		tell document preferences
			set page height to 11
			set page width to 8
			set facing pages to false
			set pages per document to 1
		end tell
	end tell
end tell


