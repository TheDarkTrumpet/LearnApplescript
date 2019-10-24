set the_record to {first_name:"Anthony", age:37, date_of_birth:date "Monday, December 4, 1967 12:00:00 AM"}
set full_path to (path to desktop as text) & "record_data"
set file_ID to open for access file full_path with write permission
write the_record to file_ID as record
close access file_ID
