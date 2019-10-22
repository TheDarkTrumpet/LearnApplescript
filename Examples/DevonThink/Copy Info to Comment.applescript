-- Copy Info to Comment
-- Created by Christian Grunenberg on Tue May 11 2004.
-- Copyright (c) 2004-2019. All rights reserved.
-- Based on (c) 2003 Apple, Inc.

property type_list : {"JPEG", "TIFF", "GIFf", "PICT", "8BIM", "PNGf"}
property extension_list : {"jpg", "jpeg", "tif", "tiff", "gif", "pct", "pict", "psd", "png"}

using terms from application "Image Events"
	property color_spaces : {Eight channel, Eight color, Five channel, Five color, Seven channel, RGB, Lab, XYZ, Six channel, CMYK, Six color, Seven color, named, Gray}
	property color_space_titles : {"Eight channel", "Eight color", "Five channel", "Five color", "Seven channel", "RGB", "Lab", "XYZ", "Six channel", "CMYK", "Six color", "Seven color", "Named", "Gray"}
	property bit_depths : {sixteen colors, color, four grays, black & white, thousands of colors, grayscale, two hundred fifty six grays, four colors, sixteen grays, millions of colors, best, two hundred fifty six colors, millions of colors plus}
	property bit_depth_titles : {"sixteen colors", "color", "four grays", "black & white", "thousands of colors", "grayscale", "256 grays", "four colors", "sixteen grays", "millions of colors", "best", "256 colors", "millions of colors plus"}
end using terms from

tell application id "DNtp"
	try
		set this_selection to the selection
		if this_selection is {} then error "Please select some images."
		repeat with this_item in this_selection
			if the type of this_item is equal to picture then
				try
					set this_path to the image of this_item
					with timeout of 30 seconds
						tell application "Image Events"
							launch
							
							set this_image to open file this_path
							set these_properties to the properties of this_image
							close this_image
							
							set this_space to the color space of these_properties
							repeat with i from 1 to the count of the color_spaces
								if this_space is item i of the color_spaces then
									set the color_space to item i of the color_space_titles
									exit repeat
								end if
							end repeat
							
							copy the resolution of these_properties to {image_DPI, y}
							set this_depth to the bit depth of these_properties
							repeat with i from 1 to the count of the color_spaces
								if this_depth is item i of the bit_depths then
									set the bit_depth to item i of the bit_depth_titles
									exit repeat
								end if
							end repeat
							copy the dimensions of these_properties to {image_width, image_height}
						end tell
						
						set the data_delimiter to ", "
						set the comment of this_item to "W: " & (image_width as string) & the data_delimiter & "H: " & (image_height as string) & the data_delimiter & "R: " & (image_DPI as string) & the data_delimiter & "BD: " & bit_depth & the data_delimiter & "CS: " & color_space
					end timeout
				end try
			end if
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then display alert "DEVONthink" message error_message as warning
	end try
end tell