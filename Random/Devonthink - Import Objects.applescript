on importLocalFile()
	tell application "DEVONthink 3"
		set testFile to "/Users/dthole/Desktop/testmdfile.md"
		set miscDatabase to get 1st database whose name = "Miscellaneous"
		set annotationFolder to 1st parent of miscDatabase whose name = "Test"
		set theResult to import testFile name "FooBar!.MD" to annotationFolder
		theResult
	end tell
end importLocalFile

on importPDFFromURL(theURL)
	tell application "DEVONthink 3"
		set miscDatabase to get 1st database whose name = "Miscellaneous"
		set annotationFolder to 1st parent of miscDatabase whose name = "Test"
		set theResult to create PDF document from theURL name "Devonthink Scripting (Paginated PDF)" in annotationFolder with pagination
		theResult
	end tell
end importPDFFromURL

importPDFFromURL("https://discourse.devontechnologies.com/c/devonthink/scripting")