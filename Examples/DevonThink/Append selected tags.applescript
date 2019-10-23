-- Append selected tags

tell application id "DNtp"
	try
		set thisSelection to the selection
		set allTags to selected text of think window 1
		if allTags is not "" then
			set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, ","}
			
			set theTags to text items of allTags
			set AppleScript's text item delimiters to od
			repeat with theRecord in thisSelection
				set tags of theRecord to (parents of theRecord) & theTags
			end repeat
		end if
	end try
end tell
