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
	
	-- Properties
	property folderPath : missing value
	property pictureName : "TestPic"
	property resize : 1
	property delayTime : 2
	property mainWindow : missing value
	property maxWidthHeight : 680
	
	-- IBActions ( button clicks )	
	on snapShot_(sender)
		mainWindow's orderOut_(me)
		delay my delayTime
		
		set folderPathString to my folderPath as string
		set pictureNameString to my pictureName as string
		set targetFile to folderPathString & pictureNameString & ".jpg"
		set quotedTargetFile to quoted form of targetFile
		
		do shell script "screencapture -t jpg -x " & quotedTargetFile
		
		if (my resize as integer) = 1 then
			set maxWidthHeight to my maxWidthHeight as integer
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
		set my folderPath to (POSIX path of (path to pictures folder))
	end awakeFromNib
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script