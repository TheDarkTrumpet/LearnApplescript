on importLocalFile()
	tell application "DEVONthink 3"
		set testFile to "/Users/dthole/Desktop/testmdfile.md"
		set miscDatabase to get 1st database whose name = "Miscellaneous"
		set annotationFolder to 1st parent of miscDatabase whose name = "Test"
		set theResult to import testFile name "FooBar!.MD" to annotationFolder
		theResult
	end tell
end importLocalFile

on importPDFFromURL(theURL, theTitle)
	tell application "DEVONthink 3"
		set miscDatabase to get 1st database whose name = "Miscellaneous"
		set annotationFolder to 1st parent of miscDatabase whose name = "Test"
		set theResult to create PDF document from theURL name theTitle in annotationFolder with pagination
		theResult
	end tell
end importPDFFromURL

on importPDFFromURLUnlessThere(theURL, theTitle)
	tell application "DEVONthink 3"
		set miscDatabase to get 1st database whose name = "Miscellaneous"
		set annotationFolder to 1st parent of miscDatabase whose name = "Test"
		set fileExistsP to exists record at ("/" & (name of annotationFolder) & "/" & theTitle) in miscDatabase
		if fileExistsP is false then
			my importPDFFromURL(theURL, theTitle)
		end if
	end tell
end importPDFFromURLUnlessThere

-- importLocalFile

set testURL to "https://discourse.devontechnologies.com/c/devonthink/scripting"
set testName to "DevonThink Scripting (Paginated PDF)"
--importPDFFromURL(testURL, testName)
importPDFFromURLUnlessThere(testURL, testName)
