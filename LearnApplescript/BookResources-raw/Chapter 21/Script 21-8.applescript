tell application "Mail"
	repeat with message_ref in (get selection)
		repeat with attachment_ref in every mail attachment of message_ref
			tell attachment_ref
				set download_path to POSIX path of (path to downloads folder) & name
				save in (POSIX file download_path)
			end tell
		end repeat
	end repeat
end tell


