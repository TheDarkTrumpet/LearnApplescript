property pTitle : "DEVONthink Batch Rename"

tell application id "DNtp"
	try
		set sourcePattern to display name editor pTitle info "Source pattern:"
		set destPattern to display name editor pTitle info "Destination pattern:"
		
		if sourcePattern is not "" and destPattern is not "" then
			set selectedItems to selection
			repeat with selectedItem in selectedItems
				set itemName to name of selectedItem
				set transformedName to do shell script "echo " & quoted form of itemName & " | sed -E 's/" & sourcePattern & "/" & destPattern & "/g'"
				set name of selectedItem to transformedName
			end repeat
			
		end if
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell
