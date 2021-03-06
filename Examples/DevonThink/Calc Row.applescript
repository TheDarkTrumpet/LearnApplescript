-- Calc Sum & Mean Value of Row.
-- Created by Christian Grunenberg on Sun Jul 04 2004.
-- Copyright (c) 2004-2019. All rights reserved.

tell application id "DNtp"
	try
		if not (exists think window 1) then error "No window is open."
		set this_window to think window 1
		tell this_window
			set selRow to selected row
			if selRow ≤ 0 then error "Please select a row in a sheet."
			
			-- First & last column are ignored like in version 1.x
			-- (e.g. useful if those columns contain identifiers or comments)
			
			copy number of columns to colCnt
			set currCol to 2
			set colCnt to colCnt - 1
			set this_sum to 0
			
			repeat while currCol ≤ colCnt
				try
					set this_cell to get cell at row selRow column currCol
					set this_sum to this_sum + this_cell
				end try
				set currCol to currCol + 1
			end repeat
			
			set colCnt to colCnt - 1
			set theMessage to "Columns: " & (colCnt as string) & return & "Sum: " & (this_sum as string) & return & "Mean Value: " & ((this_sum / colCnt) as string)
			display alert "DEVONthink" message theMessage
		end tell
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell