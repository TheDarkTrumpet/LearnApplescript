on performSmartRule(theRecords)
	tell application id "DNtp"
		
		if (count of theRecords) > 0 then
			show progress indicator "Checking Links…" steps (count of theRecords) with cancel button
			try
				repeat with theRecord in theRecords
					set theURL to (URL of theRecord)
					step progress indicator ((name of theRecord) as string)
					if theURL begins with "http" and theURL contains "://" then
						set theStatus to 0
						download URL theURL method "HEAD"
						try
							set theResponse to last downloaded response
							set theStatus to |http-status| of theResponse
							if theStatus ≤ 0 or (theStatus ≥ 400 and theStatus is not 403 and theStatus is not 405 and (theStatus is not 404 or theURL does not contain "github.com/")) then error
							set theDownloadedURL to last downloaded URL
							if theURL is not equal to theDownloadedURL then
								set URL of theRecord to theDownloadedURL
								log message theURL info "Updated URL (" & theDownloadedURL & ")"
							end if
						on error
							log message theURL info "Invalid URL (HTTP " & (theStatus as string) & ")"
							set theGroup to create location "/Invalid URLs" in (database of theRecord)
							replicate record theRecord to theGroup
						end try
					end if
					if cancelled progress then exit repeat
				end repeat
			on error error_message number error_number
				if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
			end try
			hide progress indicator
		end if
	end tell
end performSmartRule