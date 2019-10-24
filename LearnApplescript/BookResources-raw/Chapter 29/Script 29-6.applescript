on run
	set my_list to {1, 2, 3, 4, 5, 6, 7, 8, 9, 0}
	set lookup_times to {}
	repeat 16 times
		set t to AMTime
		repeat 100 times
			get middle item of my_list
		end repeat
		set end of lookup_times to round (((AMTime) - t) * 1000)
		set my_list to my_list & my_list -- Double the size of the list
	end repeat
	lookup_times
end run
--> {1, 0, 1, 1, 1, 2, 4, 8, 15, 30, 60, 120, 240, 480, 959, 1917}


