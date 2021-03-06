-- Calc Sum & Mean Value of Column.
-- Created by Christian Grunenberg on Sun Jul 04 2004.
-- Copyright (c) 2004-2019. All rights reserved.

tell application id "DNtp"
	try
		if not (exists think window 1) then error "No window is open."
		set this_window to think window 1
		tell this_window
			set selCol to selected column
			if selCol ≤ 0 then error "Please select a column in a sheet."
			copy number of rows to rowCnt
			set currRow to 1
			set this_sum to 0
			repeat while currRow ≤ rowCnt
				try
					set this_cell to get cell at row currRow column selCol
					set this_sum to this_sum + this_cell
				end try
				set currRow to currRow + 1
			end repeat
			set theMessage to "Rows: " & (rowCnt as string) & return & "Sum: " & (this_sum as string) & return & "Mean Value: " & ((this_sum / rowCnt) as string)
			display alert "DEVONthink" message theMessage
		end tell
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell