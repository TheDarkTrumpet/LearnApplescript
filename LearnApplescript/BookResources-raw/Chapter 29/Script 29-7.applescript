on run
	script FastList
		property my_list : {1, 2, 3, 4, 5, 6, 7, 8, 9, 0}
	end script
	set lookup_times to {}
	repeat 16 times
		set t to AMTime
		repeat 100 times
			get middle item of FastList's my_list
		end repeat
		set end of lookup_times to round (((AMTime) - t) * 1000)
		set FastList's my_list to FastList's my_list & FastList's my_list
	end repeat
	lookup_times
end run
--> {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0}


