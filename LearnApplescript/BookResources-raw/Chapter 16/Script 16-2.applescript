tell application "Finder"
	set application_alias to application file id "com.apple.addressbook" as alias
end tell
set icon_file to path to resource "vCard.icns" in bundle application_alias
display dialog "Who Are You?" with icon icon_file


