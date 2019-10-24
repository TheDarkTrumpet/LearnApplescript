tell application "Microsoft Excel"
	set color of font object of cell "a1" to {255, 0, 0}
	set font_color to color of font object of cell "a1"
end tell
--> {221, 8, 6}


