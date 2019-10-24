tell application "Adobe InDesign CS4"	set user interaction level of script preferences to interact with all	set graphics_folder_path to (choose folder with prompt "Choose the folder containing the graphics:") as text	set error_string to "" -- This will contain any error info

	set user interaction level of script preferences to never interact

	-- Store old ruler units and change to points	tell view preferences		set old_units to properties		set properties to {horizontal measurement units:points, vertical measurement units:points}	end tell

	-- Set up to do the search	set find grep preferences to nothing	tell find change grep options		set include footnotes to false		set include hidden layers to false		set include locked layers for find to false		set include master pages to false	end tell	set find what of find grep preferences to "<[^>]+?>"

	tell document 1		-- Make a folder in the same folder as the document, calling it Links		set doc_folder_path to file path as text		my make_links_folder(doc_folder_path)

		-- Do the grep search and store the results		set the_instances to find grep

		-- Loop through from the back		repeat with i from (count the_instances) to 1 by -1

			-- The name will be the contents minus the first and last characters			set the_graphic_name to text from character 2 to character -2 of contents of item i of the_instances			-- Get the ascent of the characters for the height of the images			set required_height to ascent of character 1 of item i of the_instances

			-- Get a reference to original file			set the_original_file to my find_graphic_file(graphics_folder_path, the_graphic_name)

			if the_original_file = missing value then				set error_string to error_string & "Missing file for " & the_graphic_name & return			else				-- Process the image in Photoshop, and return the path to the new image				set graphics_path to my prepare_graphic(the_original_file, the_graphic_name, doc_folder_path, required_height)

				if graphics_path = missing value then					set error_string to error_string & "Problem processing " & the_graphic_name & return				else					-- Delete the marker text					delete item i of the_instances					-- Put in the graphic					set {the_new_graphic} to place alias graphics_path on insertion point 1 of item i of the_instances

					-- Get geometry, scale graphic, make frame fit it					tell the_new_graphic						set {y1, x1, y2, x2} to geometric bounds						set actual_height to y2 - y1						set needed_scale to required_height / actual_height * 100						set properties to {vertical scale:needed_scale, horizontal scale:needed_scale}						fit given frame to content					end tell

					-- Stop it from splitting from any following punctuation					set no break of text from character 1 of item i of the_instances to character 2 of item i of the_instances to true

				end if			end if		end repeat	end tell	-- Reset the rulers	set properties of view preferences to old_units	-- Report the result	set user interaction level of script preferences to interact with all	if error_string = "" then		set final_message to "Finished."	else		set final_message to "The following errors occurred:" & return & return & error_string	end if	beep	with timeout of 10000 seconds		display dialog final_message buttons {"OK"} default button 1	end timeoutend tell



on make_links_folder(doc_folder_path)	tell application "Finder"		if not (exists folder "Links" of folder doc_folder_path) then			make new folder at folder doc_folder_path with properties {name:"Links"}		end if	end tellend make_links_folder

on find_graphic_file(graphics_folder_path, the_graphic_name)	try		tell application "Finder"			return to (file 1 of folder graphics_folder_path whose name begins with the_graphic_name) as alias		end tell	on error		return missing value	end tryend find_graphic_file

on prepare_graphic(the_original_file, the_graphic_name, doc_folder_path, required_height)	-- Process the file 	tell application "Adobe Photoshop CS4"		set display dialogs to never		try			open the_original_file			tell current document				-- Resize it and make it grayscale				resize image resolution 200 resample method none				resize image height required_height as points resample method bicubic				change mode to grayscale				-- Fiddle with it a bit				adjust art layers using levels adjustment with options {input range start:0, input range end:255, output range start:0, output range end:255, input range gamma:2.0}				filter art layers using unsharp mask with options {amount:200, radius:0.5, threshold:0}				-- Save it as a tiff and close it				save in file (doc_folder_path & "Links:" & the_graphic_name & ".tif") as TIFF appending no extension with options {class:TIFF save options, byte order:Mac OS, image compression:none, save layers:false, transparency:false}				close saving no			end tell		on error			-- The error might have left the pic open, so try to close it			try				set display dialogs to always				close current document saving no			end try			return missing value		end try		set display dialogs to always	end tell	return (doc_folder_path & "Links:" & the_graphic_name & ".tif")end prepare_graphic




