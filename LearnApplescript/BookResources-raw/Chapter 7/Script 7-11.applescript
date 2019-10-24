-- Get the message text from Mail
tell application "Mail"
	set the_message to item 1 of (get selection)
	set message_text to content of the_message
end tell

-- Parse the message text
set message_subject_line to paragraph 2 of message_text
set message_dates_line to paragraph 3 of message_text
set message_location_line to paragraph 4 of message_text

set the_summary to text (word 2) thru -1 of message_subject_line
set the_location to text (word 2) thru -1 of message_location_line

set the_meeting_date to text (word 3) thru (word 5) of message_dates_line
set the_start_time to text (word 6) thru (word 8) of message_dates_line
set the_end_time to text (word 10) thru (word 12) of message_dates_line

set start_date to date (the_meeting_date & space & the_start_time)
set end_date to date (the_meeting_date & space & the_end_time)

-- Create the iCal event
tell application "iCal"
	make new event at end of calendar 1 with properties {start date:start_date, end date:end_date, summary:the_summary, location:the_location, status:confirmed}
end tell


