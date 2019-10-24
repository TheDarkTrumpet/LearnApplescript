display dialog "Please enter item's cost in dollars:" default answer ""
set item_cost to (text returned of result) as real
set total_charge to item_cost * 8.25 + 3.5 + 1.7
display dialog "The total charge is $" & total_charge


