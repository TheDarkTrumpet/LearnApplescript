 property wakeup_tune_file : missing value
 property requested_time : "7:00"

 if wakeup_tune_file is missing value then
	 set wakeup_tune_file to choose file with prompt "Pick a wakeup tune:" of type {"public.audio"} without invisibles
 end if
 tell application "Finder" to set song_name to name of wakeup_tune_file

 set tomorrow_date to (current date) + (1 * days)
 repeat
	 set wake_dialog to display dialog "Enter time you want to wake up:" default answer requested_time buttons {"Stop", "OK"} default button "OK"
	 if button returned of wake_dialog is "Stop" then return
	 set requested_time to text returned of wake_dialog
	 try -- See if time entered is OK
		 set wakeup_date to date requested_time of tomorrow_date
		 exit repeat
	 on error -- Invalid time string
		 try
			 display dialog "Not a valid time. Please try again."
		 on error number -128 -- User canceled
			 return
		 end try
	 end try
 end repeat

 repeat
	 display dialog "The song \"" & song_name & "\"" & return & "should wake you up on: " & return & wakeup_date buttons {"Change Song", "OK"} default button "OK" giving up after 15
	 if button returned of result is "Change song" then
		 set wakeup_tune_file to choose file with prompt "Pick a wakeup tune:" of type {"public.audio"} without invisibles
		 tell application "Finder" to set song_name to name of wakeup_tune_file
	 else
		 exit repeat
	 end if
 end repeat

 repeat until (current date) ≥ wakeup_date
	 delay 10
 end repeat

 tell application "QuickTime Player"
	 activate
	 open wakeup_tune_file
	 tell document 1
		 set audio volume to 1.0
		 play
	 end tell
 end tell

