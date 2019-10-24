 set image_file to choose file with prompt "Please select an image file:" of type "public.image"

 try
	 tell application "Image Events"
		 set the_image to open image_file
		 tell the_image
			 set {the_width, the_height} to dimensions
			 set file_type to file type
			 set color_space to color space
			 set bit_depth to bit depth
			 set res to resolution
			 close
		 end tell
	 end tell
 on error error_text
	 display dialog "The file you picked couldn't be analyzed for some reason." buttons {"OK"} default button 1 with icon stop
	 return
 end try

 tell application "Finder"
	 set comment of image_file to "Image information:
				  File type: " & file_type & "
				  Width: " & the_width & ", height: " & the_height & "
				  Resolution: " & res & "
				  Color space: " & color_space & "
				  Bit depth: " & bit_depth
 end tell


