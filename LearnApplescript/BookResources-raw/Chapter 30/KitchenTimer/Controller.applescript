-- Controller.applescript
-- KitchenTimer

-- Created by Craig Williams on 9/27/09.
-- Copyright 2009 AllanCraig. All rights reserved.

property NSTimer : class "NSTimer" of current application

script Controller
	property parent : class "NSObject"
	
	-- IBOutlets
	property displayTime : missing value
	property startStopButton : missing value
	property timeInMinutesTextField : missing value
	
	
	-- Script properties
	property myTimer : missing value
	property totalSecondsRemaining : 0
	
	
	(*	Starts the Timer
		
		Result: If the timer is already running it will be stopped
				and a new one created.
				Otherwise, timer values are verified as existing
				and the timer is started.	
	*)
	on startTimer_(sender)
		set buttonTitle to sender's |title|()
		
		if (buttonTitle as text) is equal to "Start Timer" then
			if timeInMinutesTextField's integerValue() ≠ 0 then
				sender's setTitle_("Stop Timer")
				set numberOfMinutes to timeInMinutesTextField's integerValue()
				set totalSecondsRemaining to (numberOfMinutes * 60)
				
				set myTimer to NSTimer's ¬
					¬
						scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(1, me, "updateTime:", missing value, true)
			end if
		else
			sender's setTitle_("Start Timer")
			cancelTimer()
			displayTime's setStringValue_("Stopped!")
			playSound()
		end if
	end startTimer_
	
	
	(*	Cancels the timer
	
		Results: Timer cancelled
	
		Note: This is only called directly from the AppDelegate
			  in the event the application is closed while a
			  timer is running.
	*)
	on cancelTimer()
		if myTimer ≠ missing value then
			myTimer's invalidate()
			set myTimer to missing value
		end if
	end cancelTimer
	
	
	(*	Updates the displayTime's view
	
		Result: The view is updated with the new time and once
				the time reaches zero, the timer is stopped.
	
	*)
	on updateTime_(myTimer)
		if totalSecondsRemaining = 0 then
			cancelTimer()
			displayTime's setStringValue_("Complete")
			startStopButton's setTitle_("Start Timer")
			playSound()
		else
			set newTime to formatTime()
			displayTime's setStringValue_(newTime)
			set totalSecondsRemaining to totalSecondsRemaining - 1
		end if
	end updateTime_
	
	
	(* Formats the time for the TimerView
		
		Result: A string representation of a time value in the 
				format of 00:01:01
	*)
	on formatTime()
		set hoursLeft to totalSecondsRemaining div 3600
		set minutesLeft to (totalSecondsRemaining div 60) mod 60
		set secondsLeft to totalSecondsRemaining mod 60
		return padWithZero_(hoursLeft) & ":" & padWithZero_(minutesLeft) ¬
			& ":" & padWithZero_(secondsLeft)
	end formatTime
	
	
	(* Convenience method for padding single digit numbers with a zero
	
		Result: padded number
	*)
	on padWithZero_(the_number)
		if the_number < 10 then
			return "0" & the_number
		else
			return the_number as text
		end if
	end padWithZero_
	
	
	(* Plays the Glass system sound when timer is up
	
		Result: sound played
	
	*)
	on playSound()
		tell class "NSSound" of current application
			set soundInstance to its soundNamed_("Glass")
		end tell
		soundInstance's setVolume_(1.0)
		soundInstance's |play|()
	end playSound
	
	
end script
