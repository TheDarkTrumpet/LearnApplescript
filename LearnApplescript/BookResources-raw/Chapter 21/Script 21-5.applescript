tell application "Mail"
	tell account "Flybynight.net"
		tell mailbox "INBOX"
			set address_list to sender of every message
		end tell
	end tell
end tell


