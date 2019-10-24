--
--  KitchenTimerAppDelegate.applescript
--  KitchenTimer
--
--  Created by Craig Williams on 9/27/09.
--  Copyright 2009 AllanCraig. All rights reserved.
--

property Controller : class "Controller" of current application

script KitchenTimerAppDelegate
	-- Inheritance
	property parent : class "NSObject"
	
	
	##################################################
	# Application
	
	on awakeFromNib()
		-- Code here
	end awakeFromNib
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		Controller's cancelTimer()
		log "Cancelled timer from AppDelegate"
		return true
	end applicationShouldTerminate_
	
end script