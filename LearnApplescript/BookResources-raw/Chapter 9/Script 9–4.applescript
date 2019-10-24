set birthday to date "Wednesday, October 31, 1979 12:00:00 AM"
set today to date "Friday, July 10, 2009 12:00:00 AM"
set age_in_years to (year of today) - (year of birthday)
if (month of birthday) > (month of today) then
	set age_in_years to age_in_years - 1
else if (month of birthday) = (month of today) then
	if (day of birthday) > (day of today) then
		set age_in_years to age_in_years - 1
	end if
end if
age_in_years


