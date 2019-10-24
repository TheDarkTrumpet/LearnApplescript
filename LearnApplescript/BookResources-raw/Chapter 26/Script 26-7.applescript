tell application "Adobe InDesign CS4"
	-- Get the path 
	set graphics_link to item link of graphic 1 of selection
	set graphics_path to (file path of graphics_link) as text
	tell document 1
	
		-- Make a new layer if it doesn't exist
		try
			set caption_layer to layer "Captions"
		on error 
			-- It doesn't exist, so...
			set caption_layer to make new layer at beginning with properties {name:"Captions", printable:false}
		end try
		
		-- Make a new paragraph style if it doesn't exist
		try
			set caption_style to paragraph style "Path captions"
		on error 
			-- It doesn't exist, so...
			set caption_style to make new paragraph style with properties {applied font:"Myriad" & tab & "Roman", 
					point size:8, justification:center align, hyphenation:true}
		end try
		
		-- Store old ruler units and change to points
		tell view preferences
			set old_units to properties
			set properties to {horizontal measurement units:points, vertical measurement units:points}
		end tell
		
		-- Get the dimensions
		set {y1, x1, y2, x2} to geometric bounds of selection
		
		-- Make the new frame
		set caption_frame to make new text frame at in front of selection
		set properties of caption_frame to { geometric bounds:{y2 + 3, x1, y2 + 27, x2}, item layer:caption_layer, contents:graphics_path}
		set properties of parent story of caption_frame to {applied paragraph style:caption_style}
		
		-- Reset the rulers
		set properties of view preferences to old_units
	end tell
end tell


