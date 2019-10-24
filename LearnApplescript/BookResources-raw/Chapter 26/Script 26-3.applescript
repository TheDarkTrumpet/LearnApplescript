tell application "Adobe InDesign CS4"
	make new document
	tell document 1
		tell view preferences
			set horizontal measurement units to inches
			set vertical measurement units to inches
		end tell
		tell document preferences
			set page height to 11
			set page width to 8
			set facing pages to false
			set pages per document to 1
		end tell
		
		set text_frame_a to make new text frame at page 1 with properties {geometric bounds:{1, 1, 6, 3}}
		set text_frame_b to make new text frame at page 1 with properties {geometric bounds:{1, 5, 6, 7}}
		make new group at page 1 with properties {group items:{text_frame_a, text_frame_b}}
		get every page item of page 1
	end tell
end tell

