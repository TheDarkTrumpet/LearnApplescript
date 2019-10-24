property favorite_city : "London"

set all_cities to {"London", "Paris", "Moscow", "Sydney", "New York"}

set the_selection to choose from list all_cities with prompt "Please pick your favorite city:" default items {favorite_city}
if the_selection is false then error number -128 -- User canceled
set favorite_city to item 1 of the_selection


