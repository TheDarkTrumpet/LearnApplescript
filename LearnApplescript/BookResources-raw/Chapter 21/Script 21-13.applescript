tell application "iCal"
	set feed_ferret_event to make new event at end of events of calendar "Home" with properties { summary:"Feed ferret", location:"Providence", start date:date "Saturday, May 1, 2010 4:00:00 PM", end date:date "Saturday, May 1, 2010 4:30:00 PM", allday event:false, status:confirmed, recurrence:"FREQ=DAILY;INTERVAL=2;UNTIL=20100601"}
end tell


