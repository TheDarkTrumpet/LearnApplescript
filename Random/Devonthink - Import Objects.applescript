tell application "DEVONthink 3"
	set testFile to "/Users/dthole/Desktop/testmdfile.md"
	set miscDatabase to get 1st database whose name = "Miscellaneous"
	set annotationFolder to 1st parent of miscDatabase whose name = "Test"
	set theResult to import testFile name "FooBar!.MD" to annotationFolder
end tell