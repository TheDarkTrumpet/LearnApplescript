-- Some statements here...
set the_file to choose file
-- Some more statements here...
set file_properties to info for the_file
set file_creation_date to creation date of file_properties
set file_age_in_seconds to (current date) - file_creation_date
set days_old to file_age_in_seconds div days
-- Yet more statements that use the days_old variable here...


