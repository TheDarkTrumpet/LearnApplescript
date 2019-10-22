-- Add downloads

tell application "DEVONagent"
	try
		if not (exists browser 1) then error "No browser windows are open."
		set theSource to source of browser 1
		set theURL to URL of browser 1
		set theLinks to get links of theSource base URL theURL containing "Download"
		repeat with theLink in theLinks
			add download theLink
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONagent" message error_message as warning
	end try
end tell