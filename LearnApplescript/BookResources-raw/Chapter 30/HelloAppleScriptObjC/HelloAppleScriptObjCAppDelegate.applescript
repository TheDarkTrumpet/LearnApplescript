--
--  HelloAppleScriptObjCAppDelegate.applescript
--  HelloAppleScriptObjC
--
--  Created by Craig Williams on 3/15/10.
--  Copyright 2010 AllanCraig. All rights reserved.
--

script HelloAppleScriptObjCAppDelegate
	property parent : class "NSObject"
	property textField : missing value
	
	on buttonClick_(sender)
		set theText to textField's stringValue()
		display dialog "Here is the text you entered: " & return & theText
	end buttonClick_
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script