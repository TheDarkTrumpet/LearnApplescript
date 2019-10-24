property sales_tax : 8.25
property handling_fee : 3.5
property package_and_postage : 1.7

display dialog "Please enter item's cost in dollars:" default answer ""
set item_cost to (text returned of result) as real
set total_charge to item_cost * sales_tax + handling_fee + package_and_postage 
display dialog "The total charge is $" & total_charge


