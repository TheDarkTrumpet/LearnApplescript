tell application "FileMaker Pro"
	tell database "Customers"
		tell table "People"
			tell (first record whose ¬
				cell "first name" = "John" and ¬
				cell "middle name" starts with "L" and ¬
				cell "last name" = "Smith" and ¬
				cell "city" = "Boulder" and ¬
				cell "state" = "CO")
				-- Note: the next line will error if the person isn't found
				set person_id to cell "person id"
			end tell
		end tell
		tell table "Number"
			tell (every record whose cell "person id" = person_id)
				set person_number_list to cell "number value"
			end tell
		end tell
	end tell
end tell



