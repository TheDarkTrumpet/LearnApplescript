-- Execute the day of the party
bake_cake("Chocolate cake")
wash_dishes()
buy_food("Chips")
buy_food("Soda")
welcome_guests()

-- Handlers

to bake_cake(cake_type)
	if cake_type is "Chocolate cake" then
		-- Bake chocolate cake
	else
		-- Bake other cake
	end if
end bake_cake

to wash_dishes()
	repeat with the_dish in dish_list
		-- Wash the dish
	end repeat
end wash_dishes

to buy_food(the_item)
	-- Go to isle containing item
	-- Pick up item 
	-- Pay for item
end buy_food

to welcome_guests()
	repeat with the_person in guest_list
		-- Welcome the person to the party
	end repeat
end welcome_guests


