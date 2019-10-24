on split_name(the_name)
	set first_name to first word of the_name
	set last_name to last word of the_name
	return {first_name, last_name}
end split_name

set {forename, surname} to split_name("Paul Revere")
-- forename is "Paul", surname is "Revere"


