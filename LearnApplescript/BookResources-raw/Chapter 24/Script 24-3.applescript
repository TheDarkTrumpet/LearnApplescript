tell application "Pages"
	tell every section of document 1
		set different first page to true
		set different left and right pages to true
		set odd header to "iWork '09"
		set even header to "Pages Features"
		set odd footer to "http://www.apple.com/iwork/pages/"
		set even footer to "(c) Apple Inc., 2010"
		set alignment of odd footer to left
		set alignment of even footer to right
	end tell
end tell


