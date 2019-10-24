 tell application "Microsoft Entourage"
	 set category_names to name of categories
	 repeat with this_name in {"Family", "Christmas Card", "Private"}
		 if this_name is not in category_names then 
			 make new category with properties {name:this_name}
		 end if
	 end repeat
	 make new contact with properties { first name:"Billy", last name:"Baxter", nickname:"Bobo", home address:{street address:"1 Apple Court", city:"Hemmingford Abbots", state:"Cambridgeshire", zip:"CB4 9HG", country:"UK"}, category:{category "Family", category "Christmas Card", category "Private"}}
 end tell


