property is_initialized : false

to initialize()
	if not is_initialized then
		set is_initialized to true
		-- Do initialization here...
	end if
end initialize

on run
	initialize()
end run

on open dropped_items
	initialize()
	-- Process dropped items here...
end open

on idle
	-- Perform any periodic tasks here...
	return 60 -- Return number of seconds until the next idle call
end idle

on quit
	continue quit
	set is_initialized to false
end quit


