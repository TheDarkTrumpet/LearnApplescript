--
--  SnapShotAppDelegate.applescript
--  SnapShot
--
--  Created by Craig Williams on 9/27/09.
--  Copyright 2009 AllanCraig. All rights reserved.
--

script SnapShotAppDelegate
	-- Inheritance
	property parent : class "NSObject"
	
	-- IBOutlets
	property folderPath : missing value
	property pictureName : missing value
	property resize : missing value
	property delayTime : missing value
	property stepperValue : missing value
	property mainWindow : missing value
	property maxWidthHeight : missing value
	
	-- IBActions ( button clicks )	
	on snapShot_(sender)
		mainWindow's orderOut_(me)
		delay (delayTime's integerValue())
		
		set folderPathString to folderPath's stringValue() as string
		set pictureNameString to pictureName's stringValue() as string
		set targetFile to folderPathString & pictureNameString & ".jpg"
		set quotedTargetFile to quoted form of targetFile
		
		do shell script "screencapture -t jpg -x " & quotedTargetFile
		
		if (resize's state as integer) = 1 then
			set maxWidthHeight to maxWidthHeight's integerValue()
			log "sips --resampleHeightWidthMax " & maxWidthHeight ¬
				& space & quotedTargetFile & " --out " & quotedTargetFile
			do shell script "sips --resampleHeightWidthMax " & maxWidthHeight ¬
				& space & quotedTargetFile & " --out " & quotedTargetFile
		end if
		
		my playSound()
		mainWindow's makeKeyAndOrderFront_(me)
	end snapShot_
	
	on playSound()
		tell class "NSSound" of current application
			set soundInstance to its soundNamed_("Glass")
		end tell
		soundInstance's setVolume_(1.0)
		soundInstance's |play|()
	end playSound
	
	-- Application delegates
	on awakeFromNib()
		folderPath's setStringValue_(POSIX path of (path to pictures folder))
		delayTime's setIntegerValue_(2)
		stepperValue's setIntegerValue_(2)
		pictureName's setStringValue_("TestPic")
		maxWidthHeight's setIntegerValue_(680)
		resize's setState_(1)
	end awakeFromNib
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script