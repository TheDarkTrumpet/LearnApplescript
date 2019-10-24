display dialog "How many times should I beep?" default answer "5"
set beep_count to (text returned of result) as integer
repeat beep_count times
	beep
	delay 1
end repeat


