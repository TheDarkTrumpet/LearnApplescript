tell application "TextEdit" to activate
tell application "System Events"
	keystroke "n" using command down
	keystroke "Apple"
	key code 123
	key code {123, 123, 123} using shift down
end tell


