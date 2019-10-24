show_folder_hierarchy(choose folder, "")

on show_folder_hierarchy(the_folder, the_indent)
	-- Process this folder
	tell application "Finder"
		set the_result to the_indent & name of the_folder & return
	end tell
	-- Process each sub-folder in turn
	tell application "Finder"
		repeat with sub_folder_ref in (get every folder of the_folder)
			set the_result to the_result & my show_folder_hierarchy(contents of sub_folder_ref, the_indent & tab)
		end repeat
	end tell
	return the_result
end show_folder_hierarchy


