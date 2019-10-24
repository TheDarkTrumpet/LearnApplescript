property _Loader : AppleMods Loader

property _List : missing value

on __load__(moduleLoader)
	tell moduleLoader
		set _List to loadModule("List")
	end tell
end __load__

on run
	_Loader's initScript(me)
	set the_list to {3, 7, 1, 9, 2, 0}
	set sorted_list to _List's sortList(the_list)
	return sorted_list
end run


