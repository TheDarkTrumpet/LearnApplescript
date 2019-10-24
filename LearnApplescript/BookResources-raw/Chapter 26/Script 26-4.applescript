tell application "Adobe InDesign CS4"
	tell document 1
		tell view preferences
			set horizontal measurement units to inches
			set vertical measurement units to inches
		end tell
		set text_layer to layer "Text" 
		set black_color to color "Black"
		make new oval at beginning of page 1 with properties { geometric bounds:{0, 0, 1, 1}, item layer:text_layer, fill color:black_color}
	end tell
end tell


