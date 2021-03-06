-- Validate Sums in Last Column
-- Created by Christian Grunenberg on Tue Nov 02 2004.
-- Copyright (c) 2004-2019. All rights reserved.

tell application id "DNtp"
	try
		if not (exists think window 1) then error "No window is open."
		set this_window to think window 1
		tell this_window
			
			copy number of columns to colCnt
			copy number of rows to rowCnt
			
			if colCnt ≤ 0 or rowCnt ≤ 0 then error "Please select a sheet."
			
			set correct to true
			set lastCol to colCnt - 1
			
			set currRow to 1
			repeat while currRow ≤ rowCnt
				
				-- First & last column are ignored like in version 1.x
				-- (e.g. useful if those columns contain identifiers or comments)
				
				set currCol to 2
				set this_sum to 0 as real
				repeat while currCol < lastCol
					try
						set this_cell to get cell at row currRow column currCol
						set this_sum to this_sum + (this_cell as real)
					end try
					set currCol to currCol + 1
				end repeat
				
				try
					set last_sum to 0 as real
					set last_cell to get cell at row currRow column lastCol
					set last_sum to last_sum + (last_cell as real)
					if last_sum is not equal to this_sum and (last_sum as string) is not equal to (this_sum as string) then
						set correct to false
						set theMessage to "Incorrect sum in row " & (currRow as string) & ":" & return & (last_sum as string) & " should be " & (this_sum as string) & "."
						display alert "DEVONthink" message theMessage as warning buttons {"Cancel", "Ignore", "Correct"} default button 3
						set theButton to the button returned of the result
						if theButton is equal to "Correct" then
							set cell at row currRow column lastCol to (this_sum as string)
						else if theButton is equal to "Cancel" then
							exit repeat
						end if
					end if
				on error errMsg number errNum
					if (errNum is -128) then exit repeat
				end try
				
				set currRow to currRow + 1
			end repeat
			
			if correct then display alert "DEVONthink" message "All sums in last column are correct."
		end tell
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell