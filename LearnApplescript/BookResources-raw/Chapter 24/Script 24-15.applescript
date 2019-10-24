tell application "Microsoft Entourage"
	set new_event to make new event at calendar id 13 with properties { subject:"Test Event", content:"This is an event created to test AppleScript", all day event:true, start time:date (date string of ((current date) + 1 * days))}
end tell


