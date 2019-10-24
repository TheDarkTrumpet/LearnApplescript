-- Some statements here...
set the_file to choose file
-- Some more statements here...
set days_old to get_file_age_in_days(the_file)
-- Yet more statements that use the days_old variable here...

on get_file_age_in_days(the_file)
  set file_properties to info for the_file
  set file_creation_date to creation date of file_properties
  set file_age_in_seconds to (current date) - file_creation_date
  set days_old to file_age_in_seconds div days
  return days_old
end get_file_age_in_days


