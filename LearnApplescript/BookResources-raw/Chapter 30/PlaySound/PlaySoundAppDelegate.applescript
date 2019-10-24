--
--  PlaySoundAppDelegate.applescript
--
--  Created by Craig Williams on 10/17/09.
--  Copyright 2009 AllanCraig. All rights reserved.
--

script PlaySoundAppDelegate
	property parent : class "NSObject"
	property soundNameTextField : missing value
	
	on playSound_(sender)
		set soundName to soundNameTextField's stringValue()
		set soundFilePath to "/System/Library/Sounds/" & soundName & ".aiff"
		tell class "NSSound" of current application
			set soundInstance to its alloc()'s ¬
				initWithContentsOfFile_byReference_(soundFilePath, true)
		end tell
		soundInstance's setVolume_(1.0)
		soundInstance's |play|()
	end playSound_
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script