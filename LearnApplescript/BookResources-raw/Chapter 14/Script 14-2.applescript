property sodas_left : 4
property beers_left : 1
property vodkas_left : 5

if sodas_left > 0 then
	set my_drink to "soda"
	set sodas_left to sodas_left - 1
else if beers_left > 0 then
	set my_drink to "beer"
	set beers_left to beers_left - 1
else if vodkas_left > 0 then
	set my_drink to "vodka"
	set vodkas_left to vodkas_left - 1
else
	set my_drink to "nothing"
end if

display dialog "I'm drinking " & my_drink
display dialog "Drinks remaining:" & return & sodas_left & " soda, " & beers_left & " beer, " & vodkas_left & " vodka"


