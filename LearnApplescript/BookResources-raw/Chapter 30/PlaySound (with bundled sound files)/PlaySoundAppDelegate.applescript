--
--  PlaySoundAppDelegate.applescript
--  PlaySound
--
--  Created by Craig Williams on 10/17/09.
--  Copyright 2009 AllanCraig. All rights reserved.
--

script PlaySoundAppDelegate
	property parent : class "NSObject"
	property popupButton : missing value
	
	on playSound_(sender)
		set soundName to popupButton's titleOfSelectedItem
		
		tell class "NSBundle" of current application
			tell its mainBundle
				set soundFilePath to its pathForResource_ofType_(soundName, "aiff")
			end tell
		end tell
		
		tell class "NSSound" of current application
			set soundInstance to its alloc()'s ¬
				initWithContentsOfFile_byReference_(soundFilePath, true)
		end tell
		soundInstance's setVolume_(1.0)
		soundInstance's |play|()
		
	end playSound_
	
	on awakeFromNib()
		popupButton's addItemsWithTitles_({"Basso", "Blow", "Bottle", "Frog", ¬
			"Funk", "Glass", "Hero", "Morse", "Ping", "Pop", "Purr", "Sosumi", ¬
			"Submarine", "Tink"})
	end awakeFromNib
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script